//
//  Item2ViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class Item2ViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
  //  @IBOutlet weak var stepTitle: UITextView!
    @IBOutlet weak var stepDetailsView: UIView!
    
    @IBOutlet weak var howDistressingLabel: UILabel!
    @IBOutlet weak var distressLevelLabel: UILabel!
    
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var distressSlider: GradientSlider!
    @IBOutlet weak var border1: UIView!
    @IBOutlet weak var border2: UIView!
    @IBOutlet weak var border3: UIView!
    @IBOutlet weak var border4: UIView!
    @IBOutlet weak var creationNoteLabel: UILabel!
    @IBOutlet weak var thoughtsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stepDetailsView.backgroundColor = lightBackgroundColor
        stepDetailsView.layer.borderWidth = 1.0
        stepDetailsView.layer.borderColor = borderColor.CGColor
        closeButton.tintColor = mediumTextColor
        howDistressingLabel.textColor = mediumTextColor
        distressLevelLabel.textColor = mediumSecondaryTextColor
        remindMeLabel.textColor = mediumTextColor
        creationNoteLabel.textColor = mediumTextColor
        timeLabel.textColor = darkTextColor
        thoughtsTextView.textColor = darkTextColor
        titleTextField.textColor = darkTextColor
        
        border1.backgroundColor = borderColor
        border2.backgroundColor = borderColor
        border3.backgroundColor = borderColor
        border4.backgroundColor = borderColor
        
        distressSlider.maxColor = scale0
        distressSlider.minColor = scale0
        distressSlider.thickness = 5.0
        distressSlider.thumbSize = 40.0
        
        // Do any additional setup after loading the view.
        setTitleAndDate()
    }
    
    func setTitleAndDate() {
        
        let goalQuery = PFQuery(className:"Goal")
        goalQuery.orderByAscending("createdAt")
        
        // get most recent goal
        goalQuery.getFirstObjectInBackgroundWithBlock { (goal: PFObject?, error: NSError?) -> Void in
            if error == nil {
                print("most recent goal retrieved: \(goal!.objectId)")
                
                let stepsQuery = PFQuery(className:"Step")
                stepsQuery.whereKey("goal", equalTo: goal!)
                stepsQuery.orderByAscending("reminder_date")
                stepsQuery.whereKeyDoesNotExist("completion_date")
                
                stepsQuery.getFirstObjectInBackgroundWithBlock({ (step: PFObject?, error: NSError?) -> Void in
                    print("least recent (by reminder date) incomplete step retrieved: \(step!.objectId)")
                    
                    self.titleTextField.text = step!["description"] as? String
                    self.timeLabel.text = step!["reminder_date"] as? String
                    self.thoughtsTextView.text = step!["remember"] as? String
                    self.thoughtsTextView.textColor = darkTextColor
                    self.thoughtsTextView.font = UIFont(name: "Avenir-Next", size: 16)
                    self.distressSlider.value = CGFloat((step!["distress_expected"] as? Int)!)
                    self.setSliderData()
                })
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    func setSliderData() {
        if distressSlider.value < 9 {
            distressSlider.maxColor = scale0
            distressSlider.minColor = scale0
            distressLevelLabel.text = "Peace, serenity, total relief. No more anxiety of any kind about any particular issue."
        } else if distressSlider.value >= 9 && distressSlider.value < 18 {
            distressSlider.maxColor = scale1
            distressSlider.minColor = scale1
            distressLevelLabel.text = "No acute distress and feeling basically good. If you took special effort you might feel something unpleasant but not much."
        } else if distressSlider.value >= 18 && distressSlider.value < 27 {
            distressSlider.maxColor = scale2
            distressSlider.minColor = scale2
            distressLevelLabel.text = "A little bit upset, but not noticeable unless you took care to pay attention to your feelings and then realize, 'yes' there is something bothering me."
        } else if distressSlider.value >= 27 && distressSlider.value < 36 {
            distressLevelLabel.text = "Mildly upset. Worried, bothered to the point that you notice it."
            distressSlider.maxColor = scale3
            distressSlider.minColor = scale3
        } else if distressSlider.value >= 36 && distressSlider.value < 45 {
            distressLevelLabel.text = "Somewhat upset to the point that you cannot easily ignore an unpleasant thought. You can handle it OK but don't feel good."
            distressSlider.maxColor = scale4
            distressSlider.minColor = scale4
        } else if distressSlider.value >= 45 && distressSlider.value < 54 {
            distressLevelLabel.text = "Moderately upset, uncomfortable. Unpleasant feelings are still manageable with some effort."
            distressSlider.maxColor = scale5
            distressSlider.minColor = scale5
        } else if distressSlider.value >= 54 && distressSlider.value < 63 {
            distressLevelLabel.text = "Feeling bad to the point that you begin to think something ought to be done about the way you feel."
            distressSlider.maxColor = scale6
            distressSlider.minColor = scale6
        } else if distressSlider.value >= 63 && distressSlider.value < 72 {
            distressLevelLabel.text = "Starting to freak out, on the edge of some definitely bad feelings. You can maintain control with difficulty."
            distressSlider.maxColor = scale7
            distressSlider.minColor = scale7
        } else if distressSlider.value >= 72 && distressSlider.value < 81 {
            distressLevelLabel.text = " Freaking out. The beginning of alienation."
            distressSlider.maxColor = scale8
            distressSlider.minColor = scale8
        } else if distressSlider.value >= 81 && distressSlider.value < 90 {
            distressLevelLabel.text = "Feeling desperate. Feeling extremely freaked out to the point that it almost feels unbearable and you are getting scared of what you might do."
            distressSlider.maxColor = scale9
            distressSlider.minColor = scale9
        } else {
            distressLevelLabel.text = "Feeling bad to the point that you begin to think something ought to be done about the way you feel."
            distressSlider.maxColor = scale10
            distressSlider.minColor = scale10
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClosePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

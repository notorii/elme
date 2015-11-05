//
//  Item1ViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class Item1ViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var stepDetailsCompleteView: UIView!
    

    @IBOutlet weak var howDistressingLabel: UILabel!
    @IBOutlet weak var distressBar: UIView!
    @IBOutlet weak var actualBar: UIView!
    @IBOutlet weak var actualLabel: UILabel!
    @IBOutlet weak var expectedBar: UIView!
    @IBOutlet weak var expectedLabel: UILabel!
    @IBOutlet weak var actualMarkerView: UIView!
    @IBOutlet weak var expectedMarkerView: UIView!
    
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var border1: UIView!
    @IBOutlet weak var border2: UIView!
    @IBOutlet weak var border3: UIView!
    @IBOutlet weak var border4: UIView!
    @IBOutlet weak var border5: UIView!
    @IBOutlet weak var creationNoteLabel: UILabel!
    @IBOutlet weak var thoughtsTextView: UITextView!

    @IBOutlet weak var reflectionTextView: UITextView!
    @IBOutlet weak var reflectionNoteLabel: UILabel!
    
    var creationDistressLevel: CGFloat!
    var reflectionDistressLevel: CGFloat!

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepDetailsCompleteView.backgroundColor = lightBackgroundColor
        stepDetailsCompleteView.layer.borderWidth = 1.0
        stepDetailsCompleteView.layer.borderColor = borderColor.CGColor
        
        closeButton.tintColor = mediumTextColor
        print(closeButton.tintColor)
        
        howDistressingLabel.textColor = mediumTextColor
        
        distressBar.backgroundColor = borderColor
        distressBar.layer.cornerRadius = 4
        actualBar.backgroundColor = scale3
        expectedBar.backgroundColor = scale5
        actualLabel.textColor = mediumSecondaryTextColor
        expectedLabel.textColor = mediumSecondaryTextColor
        
        remindMeLabel.textColor = mediumTextColor
        creationNoteLabel.textColor = mediumTextColor
        timeLabel.textColor = darkTextColor
        thoughtsTextView.textColor = darkTextColor
        titleTextField.textColor = darkTextColor
        
        reflectionTextView.textColor = darkTextColor
        reflectionNoteLabel.textColor = mediumTextColor
        
        border1.backgroundColor = borderColor
        border2.backgroundColor = borderColor
        border3.backgroundColor = borderColor
        border4.backgroundColor = borderColor
        border5.backgroundColor = borderColor
        
        creationDistressLevel = 0
        reflectionDistressLevel = 9
        setTitleAndDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClosePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                    dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
                    self.timeLabel.text = dateFormatter.stringFromDate(step!["reminder_date"] as! NSDate)
                    
                    self.thoughtsTextView.text = step!["remember"] as? String
                    self.thoughtsTextView.textColor = darkTextColor
                    self.thoughtsTextView.font = UIFont(name: "Avenir-Next", size: 16)
                    self.creationDistressLevel = CGFloat((step!["distress_expected"] as? Int)!)
                    self.setUpActualDistressLevel()
                    self.setUpExpectedDistressLevel()
                })
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    func setUpActualDistressLevel() {
        if reflectionDistressLevel < 9 {
            actualMarkerView.frame.origin.x = 5
            actualBar.backgroundColor = scale0
        } else if reflectionDistressLevel >= 9 && reflectionDistressLevel < 18 {
            actualMarkerView.frame.origin.x = 35
            actualBar.backgroundColor = scale1
        } else if reflectionDistressLevel >= 18 && reflectionDistressLevel < 27 {
            actualMarkerView.frame.origin.x = 65
            actualBar.backgroundColor = scale2
        } else if reflectionDistressLevel >= 27 && reflectionDistressLevel < 36 {
            actualMarkerView.frame.origin.x = 95
            actualBar.backgroundColor = scale3
        } else if reflectionDistressLevel >= 36 && reflectionDistressLevel < 45 {
            actualMarkerView.frame.origin.x = 125
            actualBar.backgroundColor = scale4
        } else if reflectionDistressLevel >= 45 && reflectionDistressLevel < 54 {
            actualMarkerView.frame.origin.x = 155
            actualBar.backgroundColor = scale5
        } else if reflectionDistressLevel >= 54 && reflectionDistressLevel < 63 {
            actualMarkerView.frame.origin.x = 185
            actualBar.backgroundColor = scale6
        } else if reflectionDistressLevel >= 63 && reflectionDistressLevel < 72 {
            actualMarkerView.frame.origin.x = 215
            actualBar.backgroundColor = scale7
        } else if reflectionDistressLevel >= 72 && reflectionDistressLevel < 81 {
            actualMarkerView.frame.origin.x = 235
            actualBar.backgroundColor = scale8
        } else if reflectionDistressLevel >= 81 && reflectionDistressLevel < 90 {
            actualMarkerView.frame.origin.x = 265
            actualBar.backgroundColor = scale9
        } else if reflectionDistressLevel >= 90 {
            actualMarkerView.frame.origin.x = 295
            actualBar.backgroundColor = scale10
        }
    }
    
    func setUpExpectedDistressLevel() {
        if creationDistressLevel < 9 {
            expectedMarkerView.frame.origin.x = 5
            expectedBar.backgroundColor = scale0
        } else if creationDistressLevel >= 9 && creationDistressLevel < 18 {
            expectedMarkerView.frame.origin.x = 35
            expectedBar.backgroundColor = scale1
        } else if creationDistressLevel >= 18 && creationDistressLevel < 27 {
            expectedMarkerView.frame.origin.x = 65
            expectedBar.backgroundColor = scale2
        } else if creationDistressLevel >= 27 && creationDistressLevel < 36 {
            expectedMarkerView.frame.origin.x = 95
            expectedBar.backgroundColor = scale3
        } else if creationDistressLevel >= 36 && creationDistressLevel < 45 {
            expectedMarkerView.frame.origin.x = 125
            expectedBar.backgroundColor = scale4
        } else if creationDistressLevel >= 45 && creationDistressLevel < 54 {
            expectedMarkerView.frame.origin.x = 155
            expectedBar.backgroundColor = scale5
        } else if creationDistressLevel >= 54 && creationDistressLevel < 63 {
            expectedMarkerView.frame.origin.x = 185
            expectedBar.backgroundColor = scale6
        } else if creationDistressLevel >= 63 && creationDistressLevel < 72 {
            expectedMarkerView.frame.origin.x = 215
            expectedBar.backgroundColor = scale7
        } else if creationDistressLevel >= 72 && creationDistressLevel < 81 {
            expectedMarkerView.frame.origin.x = 235
            expectedBar.backgroundColor = scale8
        } else if creationDistressLevel >= 81 && creationDistressLevel < 90 {
            expectedMarkerView.frame.origin.x = 265
            expectedBar.backgroundColor = scale9
        } else if creationDistressLevel >= 90 {
            expectedMarkerView.frame.origin.x = 285
            expectedBar.backgroundColor = scale10
        }

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

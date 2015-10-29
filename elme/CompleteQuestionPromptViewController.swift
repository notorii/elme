//
//  CompleteQuestionPromptViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class CompleteQuestionPromptViewController: UIViewController {

    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var distressLevelView: UIView!
    @IBOutlet weak var howDistressingLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var distressLevelLabel: UILabel!
    
    @IBOutlet weak var thoughtsView: UIView!
    @IBOutlet weak var thoughtsTextView: UITextView!

    @IBOutlet weak var completeStepButton: UIButton!
    @IBOutlet weak var distressSlider: GradientSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = lightBackgroundColor
        
    
        
        stepLabel.textColor = darkTextColor
        dateLabel.textColor = darkSecondaryTextColor
        
        howDistressingLabel.textColor = mediumTextColor
        distressLevelLabel.textColor = mediumSecondaryTextColor
        distressLevelView.backgroundColor = lightBackgroundColor
        distressLevelView.layer.borderWidth = 1
        distressLevelView.layer.borderColor = borderColor.CGColor
        
        thoughtsView.layer.borderWidth = 1
        thoughtsView.layer.borderColor = borderColor.CGColor
        thoughtsTextView.textColor = placeholderTextColor
        
        completeStepButton.layer.borderWidth = 1
        completeStepButton.layer.borderColor = borderColor.CGColor
        completeStepButton.setTitleColor(mediumTextColor, forState: .Normal)
        completeStepButton.layer.cornerRadius = 4
        
        distressSlider.thickness = 5.0
        distressSlider.thumbSize = 40.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCompletePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSliderChange(sender: GradientSlider) {
        if sender.value > 40 && sender.value < 60 {
            distressLevelLabel.text = "Moderately upset, uncomfortable. Unpleasant feelings are still manageable with some effort."
        } else if sender.value > 25 && sender.value < 50 {
            distressLevelLabel.text = "middle text"
            
        } else if sender.value > 60 {
            distressLevelLabel.text = "Feeling bad to the point that you begin to think something ought to be done about the way you feel."
        } else {
            distressLevelLabel.text = "lowest text"
            
        }
    }
       
    func textViewDidBeginEditing(textView: UITextView) {
        print("text view editing")
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
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

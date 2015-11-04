//
//  CompleteQuestionPromptViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class CompleteQuestionPromptViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var interactiveView: UIView!
    var interactiveViewOriginalCenter: CGPoint!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var stepViewOriginalCenter: CGPoint!

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
        
        closeButton.tintColor = mediumTextColor
    
        
        stepLabel.textColor = darkTextColor
        dateLabel.textColor = darkSecondaryTextColor
        stepViewOriginalCenter = stepView.center
        
        howDistressingLabel.textColor = mediumTextColor
        distressLevelLabel.textColor = mediumSecondaryTextColor
        distressLevelView.backgroundColor = lightBackgroundColor
        distressLevelView.layer.borderWidth = 1
        distressLevelView.layer.borderColor = borderColor.CGColor
        distressSlider.maxColor = scale0
        distressSlider.minColor = scale0
        distressSlider.thickness = 5.0
        distressSlider.thumbSize = 40.0

        distressLevelLabel.text = "Peace, serenity, total relief. No more anxiety of any kind about any particular issue."
        
        thoughtsView.layer.borderWidth = 1
        thoughtsView.layer.borderColor = borderColor.CGColor
        thoughtsTextView.textColor = placeholderTextColor
        thoughtsTextView.delegate = self
        interactiveViewOriginalCenter = interactiveView.center
        thoughtsTextView.returnKeyType = UIReturnKeyType.Done
        
        completeStepButton.layer.borderWidth = 1
        completeStepButton.layer.borderColor = borderColor.CGColor
        completeStepButton.setTitleColor(mediumTextColor, forState: .Normal)
        completeStepButton.layer.cornerRadius = 4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSliderChange(sender: GradientSlider) {
        if sender.value < 9 {
            distressSlider.maxColor = scale0
            distressSlider.minColor = scale0
            distressLevelLabel.text = "Peace, serenity, total relief. No more anxiety of any kind about any particular issue."
        } else if sender.value >= 9 && sender.value < 18 {
            distressSlider.maxColor = scale1
            distressSlider.minColor = scale1
             distressLevelLabel.text = "No acute distress and feeling basically good. If you took special effort you might feel something unpleasant but not much."
        } else if sender.value >= 18 && sender.value < 27 {
            distressSlider.maxColor = scale2
            distressSlider.minColor = scale2
            distressLevelLabel.text = "A little bit upset, but not noticeable unless you took care to pay attention to your feelings and then realize, 'yes' there is something bothering me."
        } else if sender.value >= 27 && sender.value < 36 {
            distressLevelLabel.text = "Mildly upset. Worried, bothered to the point that you notice it."
            distressSlider.maxColor = scale3
            distressSlider.minColor = scale3
        } else if sender.value >= 36 && sender.value < 45 {
            distressLevelLabel.text = "Somewhat upset to the point that you cannot easily ignore an unpleasant thought. You can handle it OK but don't feel good."
            distressSlider.maxColor = scale4
            distressSlider.minColor = scale4
        } else if sender.value >= 45 && sender.value < 54 {
            distressLevelLabel.text = "Moderately upset, uncomfortable. Unpleasant feelings are still manageable with some effort."
            distressSlider.maxColor = scale5
            distressSlider.minColor = scale5
        } else if sender.value >= 54 && sender.value < 63 {
            distressLevelLabel.text = "Feeling bad to the point that you begin to think something ought to be done about the way you feel."
            distressSlider.maxColor = scale6
            distressSlider.minColor = scale6
        } else if sender.value >= 63 && sender.value < 72 {
            distressLevelLabel.text = "Starting to freak out, on the edge of some definitely bad feelings. You can maintain control with difficulty."
            distressSlider.maxColor = scale7
            distressSlider.minColor = scale7
        } else if sender.value >= 72 && sender.value < 81 {
            distressLevelLabel.text = " Freaking out. The beginning of alienation."
            distressSlider.maxColor = scale8
            distressSlider.minColor = scale8
        } else if sender.value >= 81 && sender.value < 90 {
            distressLevelLabel.text = "Feeling desperate. Feeling extremely freaked out to the point that it almost feels unbearable and you are getting scared of what you might do."
            distressSlider.maxColor = scale9
            distressSlider.minColor = scale9
        } else {
            UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
            self.distressLevelLabel.text = "Feeling bad to the point that you begin to think something ought to be done about the way you feel."
                }, completion: nil)
            distressSlider.maxColor = scale10
            distressSlider.minColor = scale10
        }
    }
       
    func textViewDidBeginEditing(thoughtsTextView: UITextView) {
        print("text view editing", terminator: "")
        if thoughtsTextView.textColor == UIColor.lightGrayColor() {
            thoughtsTextView.text = nil
            thoughtsTextView.textColor = UIColor.blackColor()
        }
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
            self.interactiveView.center.y = self.interactiveViewOriginalCenter.y + -80
            self.thoughtsTextView.text = ""
            self.thoughtsView.backgroundColor = UIColor(white: 1, alpha: 1)
            self.thoughtsTextView.textColor = darkTextColor
            self.stepView.center.y = self.stepViewOriginalCenter.y - 60
            }, completion: nil)
        
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        keyboardDismiss()
    }
    
    func keyboardDismiss() {
        view.endEditing(true)
        print("tap gesture")
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
            self.interactiveView.center.y = self.interactiveViewOriginalCenter.y
            self.thoughtsView.backgroundColor = UIColor(white: 1, alpha: 0.8)
            self.stepView.center.y = self.stepViewOriginalCenter.y
            
            if self.thoughtsTextView.text == "" {
                self.thoughtsTextView.text = "How did it go? What did you expect to happen? What actually happened?"
                self.thoughtsTextView.textColor = placeholderTextColor
            }

            }, completion: nil)
//        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
//            self.interactiveView.center.y = self.interactiveViewOriginalCenter.y
//            self.thoughtsView.backgroundColor = UIColor(white: 1, alpha: 0.8)
//            self.stepView.center.y = self.stepViewOriginalCenter.y
//            
//            if self.thoughtsTextView.text == "" {
//                self.thoughtsTextView.text = "How did it go? What did you expect to happen? What actually happened?"
//                self.thoughtsTextView.textColor = placeholderTextColor
//            }
//            }, completion: nil)
    }
    
    func textView(thoughtsTextView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            keyboardDismiss()
            print("THIS ALSO NEEDS TO RUN THE NEXT STEPS", terminator: "")
            //RUN NEXT STEPS HERE
        }
        return true
    }
    
    
    @IBAction func onCompletePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        print("complete pressed", terminator: "")
        //RUN NEXT STEPS HERE
        
    }
    @IBAction func onClosePress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        print("closed press")
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

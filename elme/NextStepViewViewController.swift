//
//  NextStepViewViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class NextStepViewViewController: UIViewController {


    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var testExpand: UIView!
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var navBarView: UIImageView!
    @IBOutlet weak var hamburgerButton: UIButton!
    
    var hamburgerViewController: HamburgerViewController!
    var isMenuOpen = false
    
    var newGoalTransition: NewGoalTransition!
    var counter = 0
    
    var stepForCompletion: PFObject!
    
    var chevronTapped: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set to blank so we never see the placeholder values. will be set to values from parse later.
        stepLabel.text = ""
        dateLabel.text = ""
        
        view.backgroundColor = darkBackgroundColor
        stepLabel.textColor = darkTextColor
        dateLabel.textColor = darkSecondaryTextColor
        
        testExpand.backgroundColor = lightBackgroundColor
        testExpand.layer.borderColor = borderColor.CGColor
        testExpand.layer.borderWidth = 1.0
        testExpand.layer.cornerRadius = testExpand.frame.size.width/2
        testExpand.clipsToBounds = true
        
        setTitleAndDate()
    }
    
    /* This is called when CompleteQuestionPromptViewController exits. It's called immediately when
     * the 'Complete' button is pressed, and is therefore executed before Parse has a chance to save
     * the completed goal/step. Therefore add a 1 second delay, giving it a chance to save. This is 
     * very brittle and should be executed as a callback on the function that saves data to Parse. TODO
     */
    @IBAction func unwindStepCompletion(segue: UIStoryboardSegue) {
        delay(1) {
            self.setTitleAndDate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTitleAndDate() {
        
        let goalQuery = PFQuery(className:"Goal")
        goalQuery.orderByDescending("createdAt")
        
        // get most recent goal
        goalQuery.getFirstObjectInBackgroundWithBlock { (goal: PFObject?, error: NSError?) -> Void in
            if error == nil {
                print("most recent goal retrieved: \(goal!.objectId)")
                
                let stepsQuery = PFQuery(className:"Step")
                stepsQuery.whereKey("goal", equalTo: goal!)
                stepsQuery.orderByAscending("reminder_date")
                stepsQuery.whereKeyDoesNotExist("completed_at")
                
                stepsQuery.getFirstObjectInBackgroundWithBlock({ (step: PFObject?, error: NSError?) -> Void in
                    print("least recent (by reminder date) incomplete step retrieved: \(step!.objectId)")
                    
                    self.stepLabel.text = step!["description"] as? String
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                    dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
                    self.dateLabel.text = dateFormatter.stringFromDate(step!["reminder_date"] as! NSDate)
                    
                    self.stepForCompletion = step!
                })
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    

    @IBOutlet weak var onCheckmarkTap: UIButton!
    
    @IBAction func onMenuTap(sender: AnyObject) {
        if (isMenuOpen == false) {
            hamburgerViewController.openMenu()
            isMenuOpen = true
        } else {
            hamburgerViewController.closeMenu()
            isMenuOpen = false
        }
    }
    
    @IBAction func onRightChevronTap(sender: AnyObject) {
        self.chevronTapped = true
    }
    

    @IBAction func onLongPress(sender: UILongPressGestureRecognizer) {
    
        switch sender.state
        {
        case .Began:
            print("began press")
        case .Changed:
            print("changed press")

            if counter > 22 {
                performSegueWithIdentifier("CompleteQuestionStep", sender: self)
                delay(1) {
                    self.testExpand.transform = CGAffineTransformMakeScale(1, 1)
                    self.counter = 0
                }
            } else {
                counter = counter + 1
                print(counter)
                var checkmarkScaleX = convertValue(CGFloat(counter), r1Min: 0, r1Max: 120, r2Min: 1, r2Max: 2)

                print(checkmarkScaleX)
                testExpand.transform = CGAffineTransformScale(self.testExpand.transform, CGFloat(checkmarkScaleX), CGFloat(checkmarkScaleX))
                
                
            }

        case .Ended:
            print("end press")
                        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
                            self.testExpand.transform = CGAffineTransformMakeScale(1, 1)
                            
                            }, completion: nil)
                        counter = 0
        default: ()
        }
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (chevronTapped != true) {
            let destinationViewController = segue.destinationViewController as! CompleteQuestionPromptViewController
            // pass through the next step to CompleteQuestionPromptViewController
            destinationViewController.stepForCompletion = stepForCompletion
            newGoalTransition = NewGoalTransition()
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = newGoalTransition
            newGoalTransition.duration = 0.01
            chevronTapped = false // reset, probably not even necessary
        }
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
            self.testExpand.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }, completion: {
                (value: Bool) in
                self.testExpand.transform = CGAffineTransformMakeScale(1, 1)
        })
    }
    
}

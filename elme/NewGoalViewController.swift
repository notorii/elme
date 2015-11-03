//
//  NewGoalViewController.swift
//  elme
//
//  Created by Sai Perchard on 10/28/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class NewGoalViewController: UIViewController {

    @IBOutlet weak var addSteps: UIButton!
    @IBOutlet weak var screenMask: UIView!
    
    var addStepsTransition: AddStepsTransition!
    var newGoalButton: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = lightBackgroundColor
        
        addSteps.layer.borderColor = borderColor.CGColor
        addSteps.layer.borderWidth = 1
        addSteps.setTitleColor(mediumTextColor, forState: .Normal)
        addSteps.layer.cornerRadius = 4
        
        screenMask.alpha = 0
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        newGoalButton = CAShapeLayer()
        newGoalButton.frame = CGRect(x: 162.5, y: 308.5, width: 50, height: 50)
        newGoalButton.path = UIBezierPath(ovalInRect:newGoalButton.bounds).CGPath
        newGoalButton.strokeColor = borderColor.CGColor
        newGoalButton.lineWidth = 1
        
        view.layer.mask = newGoalButton
        
        // http://stackoverflow.com/questions/30274017/calling-a-parent-uiviewcontroller-method-from-a-child-uiviewcontroller
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "collapseAddStepsButton:", name:"addStepsDismissed", object: nil)
    }
    
    // deal with case where we are coming back to this screen from the add step details screen (i.e. user has clicked x)
    func collapseAddStepsButton(notification: NSNotification){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.screenMask.alpha = 0
            self.addSteps.frame = CGRectMake(0, 0, self.view.frame.width - 20, 53)
            self.addSteps.frame.origin = CGPoint(x: 10, y: 604)
        })
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        CATransaction.begin()
        CATransaction.setValue(0.8, forKey: kCATransactionAnimationDuration)
        newGoalButton.transform = CATransform3DMakeScale(20, 20, 1)
        CATransaction.commit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController
        addStepsTransition = AddStepsTransition()
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = addStepsTransition
        addStepsTransition.duration = 0.05
    }
    
    @IBAction func addSteps(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.screenMask.alpha = 1
            self.addSteps.frame = CGRectMake(0, 0, self.view.frame.width - 20, self.view.frame.height - 20)
            self.addSteps.frame.origin = CGPoint(x: 10, y: 10)
            
            }) { (Bool) -> Void in
                self.performSegueWithIdentifier("segueToAddSteps", sender: self)
        }
    }

    @IBAction func onDismissButton(sender: UIButton) {
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        CATransaction.setValue(0.5, forKey: kCATransactionAnimationDuration)
        newGoalButton.transform = CATransform3DMakeScale(1/20, 1/20, 1)
        CATransaction.commit()
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

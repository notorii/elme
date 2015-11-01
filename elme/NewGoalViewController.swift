//
//  NewGoalViewController.swift
//  elme
//
//  Created by Sai Perchard on 10/28/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class NewGoalViewController: UIViewController {

    @IBOutlet weak var addSteps: UIButton!
    @IBOutlet weak var screenMask: UIView!
    
    var addStepsTransition: AddStepsTransition!
    
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
        addStepsTransition.duration = 0.1
    }
    
    @IBAction func addSteps(sender: AnyObject) {
        
        addSteps.setTitle("", forState: .Normal)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.screenMask.alpha = 1
            self.addSteps.frame = CGRectMake(0, 0, self.view.frame.width - 20, self.view.frame.height - 20)
            self.addSteps.frame.origin = CGPoint(x: 10, y: 10)
            
            }) { (Bool) -> Void in
                self.performSegueWithIdentifier("segueToAddSteps", sender: self)
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

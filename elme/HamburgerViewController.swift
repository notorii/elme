//
//  HamburgerViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/24/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var hamburgerButtonHack: UIButton!
    
    var initialCenter: CGPoint!
    
    var menuVC: UIViewController!
    var nextStepHomeVC: UINavigationController!
    var newGoalVC: UIViewController!
    
   // viewControllers = [homeViewController, menuViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let user = PFUser.currentUser()
        
        menuVC = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        nextStepHomeVC = storyboard.instantiateViewControllerWithIdentifier("NextStepHome") as! UINavigationController
        newGoalVC = storyboard.instantiateViewControllerWithIdentifier("NewGoalHome")
        
        let nextStepHomeTopVC = nextStepHomeVC.topViewController as! NextStepViewViewController
        nextStepHomeTopVC.hamburgerViewController = self
        
        // this gets all the user's goal + any goals with global read/write permissions. technically there shouldn't be any goals with global read/write permissions...
        let goalQuery = PFQuery(className:"Goal")
        
        goalQuery.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) goals.")
                
                // if user has created a goal show next step home, otherwise show new goal home
                if (objects!.count > 0) {
                    self.nextStepHomeVC.view.frame = self.contentView.frame
                    self.contentView.addSubview(self.nextStepHomeVC.view)
                } else {
                    self.newGoalVC.view.frame = self.contentView.frame
                    self.contentView.addSubview(self.newGoalVC.view)
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        menuVC.view.frame = menuView.frame
        menuView.addSubview(menuVC.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let location = sender.locationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = contentView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed{
            contentView.center = CGPoint(x: translation.x + initialCenter.x, y:initialCenter.y)
            if velocity.x > 0 {
                self.contentView.center = self.view.center
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended{
            
                if velocity.x < 0 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.contentView.center = self.view.center
                        })
                    
                } else{
                    self.openMenu()
                }

            
        }
        
    }
    
    func openMenu() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.contentView.center = CGPoint(x: self.view.center.x + 280, y: self.view.center.y)
            
        })
    }
    
//
//    @IBAction func onHamburgerPress(sender: AnyObject) {
//        UIView.animateWithDuration(0.3, animations: { () -> Void in
//            
//                self.contentView.center = CGPoint(x: self.view.center.x + 280, y: self.view.center.y)
//                
//            
//        })
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

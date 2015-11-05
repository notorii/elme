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
    var newGoalVC: HomeViewController! // inconsistent naming here...
    
    var nextStepViewViewController: NextStepViewViewController!
    
    var currentState: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuVC = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        nextStepHomeVC = storyboard.instantiateViewControllerWithIdentifier("NextStepHome") as! UINavigationController
        newGoalVC = storyboard.instantiateViewControllerWithIdentifier("NewGoalHome") as! HomeViewController
        
        let nextStepHomeTopVC = nextStepHomeVC.topViewController as! NextStepViewViewController
        nextStepHomeTopVC.hamburgerViewController = self
        newGoalVC.hamburgerViewController = self
        
        // this gets all the user's goal + any goals with global read/write permissions. technically there shouldn't be any goals with global read/write permissions...
        let goalQuery = PFQuery(className:"Goal")
        goalQuery.orderByDescending("createdAt")
        
        goalQuery.getFirstObjectInBackgroundWithBlock { (goal: PFObject?, error: NSError?) -> Void in
            if error == nil {
                print("[hamburger] most recent goal retrieved: \(goal!.objectId)")
                
                let stepsQuery = PFQuery(className:"Step")
                stepsQuery.whereKey("goal", equalTo: goal!)
                stepsQuery.orderByAscending("reminder_date")
                stepsQuery.whereKeyDoesNotExist("completed_at")
                
                stepsQuery.getFirstObjectInBackgroundWithBlock({ (step: PFObject?, error: NSError?) -> Void in
                    if error != nil || step == nil {
                        print("[hamburger] step is nil - show newGoalVC")
                        self.newGoalVC.view.frame = self.contentView.frame
                        self.contentView.addSubview(self.newGoalVC.view)
                        self.currentState = "newGoalVC"
                    } else {
                        print("[hamburger] step is not nil - show nextStepHomeVC")
                        self.nextStepHomeVC.view.frame = self.contentView.frame
                        self.contentView.addSubview(self.nextStepHomeVC.view)
                        self.currentState = "nextStepHomeVC"
                    }
                })
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        menuVC.view.frame = menuView.frame
        menuView.addSubview(menuVC.view)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("[hamburger] viewWillAppear called")
        
        if currentState != nil && currentState == "nextStepHomeVC" {
            print("[hamburger] view will appear called AND current state is next step home VC - setting title and date via nextStepViewViewController")
            nextStepViewViewController.setTitleAndDate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
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
                self.closeMenu()
            } else{
                self.openMenu()
            }
        }
    }
    
    func closeMenu() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.contentView.center = self.view.center
        })
    }
    
    func openMenu() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.contentView.center = CGPoint(x: self.view.center.x + 280, y: self.view.center.y)
        })
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

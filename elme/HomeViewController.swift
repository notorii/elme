//
//  HomeViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/24/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var newGoalTransition: NewGoalTransition!
    
    var hamburgerViewController: HamburgerViewController!
    var isMenuOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController
        newGoalTransition = NewGoalTransition()
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = newGoalTransition
        //destinationViewController.presentViewController(self, animated: true, completion: nil)
        newGoalTransition.duration = 0.01
    }
    
    @IBAction func onHamburgerTap(sender: AnyObject) {
        if (isMenuOpen == false) {
            hamburgerViewController.openMenu()
            isMenuOpen = true
        } else {
            hamburgerViewController.closeMenu()
            isMenuOpen = false
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

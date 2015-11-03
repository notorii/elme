//
//  NextStepViewViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class NextStepViewViewController: UIViewController {

    @IBOutlet weak var timeDateLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var navBarView: UIImageView!
    
    var newGoalTransition: NewGoalTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var onCheckmarkTap: UIButton!
    @IBAction func onMenuTap(sender: AnyObject) {
    }
    @IBAction func onRightChevronTap(sender: AnyObject) {
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController
        newGoalTransition = NewGoalTransition()
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = newGoalTransition
        //destinationViewController.presentViewController(self, animated: true, completion: nil)
        newGoalTransition.duration = 0.01
    }

    
}

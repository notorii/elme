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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = lightBackgroundColor
        
        addSteps.layer.borderColor = borderColor.CGColor
        addSteps.layer.borderWidth = 1
        addSteps.layer.borderColor = borderColor.CGColor
        addSteps.setTitleColor(mediumTextColor, forState: .Normal)
        addSteps.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addSteps(sender: AnyObject) {
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

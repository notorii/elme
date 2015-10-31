//
//  Item2ViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class Item2ViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
  //  @IBOutlet weak var stepTitle: UITextView!
    @IBOutlet weak var stepDetailsView: UIView!
    
    @IBOutlet weak var howDistressingLabel: UILabel!
    @IBOutlet weak var distressLevelLabel: UILabel!
    
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var border1: UIView!
    @IBOutlet weak var border2: UIView!
    @IBOutlet weak var border3: UIView!
    @IBOutlet weak var border4: UIView!
    @IBOutlet weak var creationNoteLabel: UILabel!
    @IBOutlet weak var thoughtsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        stepDetailsView.backgroundColor = lightBackgroundColor
        stepDetailsView.layer.borderWidth = 1.0
        stepDetailsView.layer.borderColor = borderColor.CGColor
        closeButton.tintColor = mediumTextColor
        howDistressingLabel.textColor = mediumTextColor
        distressLevelLabel.textColor = mediumSecondaryTextColor
        remindMeLabel.textColor = mediumTextColor
        creationNoteLabel.textColor = mediumTextColor
        timeLabel.textColor = darkTextColor
        thoughtsTextView.textColor = darkTextColor
        titleTextField.textColor = darkTextColor
        
        border1.backgroundColor = borderColor
        border2.backgroundColor = borderColor
        border3.backgroundColor = borderColor
        border4.backgroundColor = borderColor
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func onClosePress(sender: UIButton) {
//        dismissViewControllerAnimated(true, completion: nil)
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

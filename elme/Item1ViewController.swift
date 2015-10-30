//
//  Item1ViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class Item1ViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
   
    @IBOutlet weak var stepDetailsCompleteView: UIView!
    
    @IBOutlet weak var howDistressingLabel: UILabel!
    
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var border1: UIView!
    @IBOutlet weak var border2: UIView!
    @IBOutlet weak var border3: UIView!
    @IBOutlet weak var border4: UIView!
    @IBOutlet weak var border5: UIView!
    @IBOutlet weak var creationNoteLabel: UILabel!
    @IBOutlet weak var thoughtsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepDetailsCompleteView.backgroundColor = lightBackgroundColor
        stepDetailsCompleteView.layer.borderWidth = 1.0
        stepDetailsCompleteView.layer.borderColor = borderColor.CGColor
        
        closeButton.tintColor = mediumTextColor
        
        howDistressingLabel.textColor = mediumTextColor
        remindMeLabel.textColor = mediumTextColor
        creationNoteLabel.textColor = mediumTextColor
        timeLabel.textColor = darkTextColor
        thoughtsTextView.textColor = darkTextColor
        titleTextField.textColor = darkTextColor
        
        border1.backgroundColor = borderColor
        border2.backgroundColor = borderColor
        border3.backgroundColor = borderColor
        border4.backgroundColor = borderColor
        border5.backgroundColor = borderColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClosePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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

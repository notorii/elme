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
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var stepDetailsCompleteView: UIView!
    

    @IBOutlet weak var howDistressingLabel: UILabel!
    @IBOutlet weak var distressBar: UIView!
    @IBOutlet weak var actualBar: UIView!
    @IBOutlet weak var actualLabel: UILabel!
    @IBOutlet weak var expectedBar: UIView!
    @IBOutlet weak var expectedLabel: UILabel!
    @IBOutlet weak var actualMarkerView: UIView!
    @IBOutlet weak var expectedMarkerView: UIView!
    
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var border1: UIView!
    @IBOutlet weak var border2: UIView!
    @IBOutlet weak var border3: UIView!
    @IBOutlet weak var border4: UIView!
    @IBOutlet weak var border5: UIView!
    @IBOutlet weak var creationNoteLabel: UILabel!
    @IBOutlet weak var thoughtsTextView: UITextView!

    @IBOutlet weak var reflectionTextView: UITextView!
    @IBOutlet weak var reflectionNoteLabel: UILabel!
    
    var creationDistressLevel: CGFloat!
    var reflectionDistressLevel: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepDetailsCompleteView.backgroundColor = lightBackgroundColor
        stepDetailsCompleteView.layer.borderWidth = 1.0
        stepDetailsCompleteView.layer.borderColor = borderColor.CGColor
        
        closeButton.tintColor = mediumTextColor
        
        howDistressingLabel.textColor = mediumTextColor
        
        distressBar.backgroundColor = borderColor
        distressBar.layer.cornerRadius = 4
        actualBar.backgroundColor = scale3
        expectedBar.backgroundColor = scale5
        actualLabel.textColor = mediumSecondaryTextColor
        expectedLabel.textColor = mediumSecondaryTextColor
        
        remindMeLabel.textColor = mediumTextColor
        creationNoteLabel.textColor = mediumTextColor
        timeLabel.textColor = darkTextColor
        thoughtsTextView.textColor = darkTextColor
        titleTextField.textColor = darkTextColor
        
        reflectionTextView.textColor = darkTextColor
        reflectionNoteLabel.textColor = mediumTextColor
        
        border1.backgroundColor = borderColor
        border2.backgroundColor = borderColor
        border3.backgroundColor = borderColor
        border4.backgroundColor = borderColor
        border5.backgroundColor = borderColor
        
        creationDistressLevel = 0
        reflectionDistressLevel = 9
        setUpActualDistressLevel()
        setUpExpectedDistressLevel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClosePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setUpActualDistressLevel() {
        if reflectionDistressLevel == 0 {
            actualMarkerView.frame.origin.x = 5
            actualBar.backgroundColor = scale0
        } else if reflectionDistressLevel == 1 {
            actualMarkerView.frame.origin.x = 35
            actualBar.backgroundColor = scale1
        } else if reflectionDistressLevel == 2 {
            actualMarkerView.frame.origin.x = 65
            actualBar.backgroundColor = scale2
        } else if reflectionDistressLevel == 3 {
            actualMarkerView.frame.origin.x = 95
            actualBar.backgroundColor = scale3
        } else if reflectionDistressLevel == 4 {
            actualMarkerView.frame.origin.x = 125
            actualBar.backgroundColor = scale4
        } else if reflectionDistressLevel == 5 {
            actualMarkerView.frame.origin.x = 155
            actualBar.backgroundColor = scale5
        } else if reflectionDistressLevel == 6 {
            actualMarkerView.frame.origin.x = 185
            actualBar.backgroundColor = scale6
        } else if reflectionDistressLevel == 7 {
            actualMarkerView.frame.origin.x = 215
            actualBar.backgroundColor = scale7
        } else if reflectionDistressLevel == 8 {
            actualMarkerView.frame.origin.x = 235
            actualBar.backgroundColor = scale8
        } else if reflectionDistressLevel == 9 {
            actualMarkerView.frame.origin.x = 265
            actualBar.backgroundColor = scale9
        } else if reflectionDistressLevel == 10 {
            actualMarkerView.frame.origin.x = 295
            actualBar.backgroundColor = scale10
        }
    }
    
    func setUpExpectedDistressLevel() {
        if creationDistressLevel == 0 {
            expectedMarkerView.frame.origin.x = 5
            expectedBar.backgroundColor = scale0
        } else if creationDistressLevel == 1 {
            expectedMarkerView.frame.origin.x = 35
            expectedBar.backgroundColor = scale1
        } else if creationDistressLevel == 2 {
            expectedMarkerView.frame.origin.x = 65
            expectedBar.backgroundColor = scale2
        } else if creationDistressLevel == 3 {
            expectedMarkerView.frame.origin.x = 95
            expectedBar.backgroundColor = scale3
        } else if creationDistressLevel == 4 {
            expectedMarkerView.frame.origin.x = 125
            expectedBar.backgroundColor = scale4
        } else if creationDistressLevel == 5 {
            expectedMarkerView.frame.origin.x = 155
            expectedBar.backgroundColor = scale5
        } else if creationDistressLevel == 6 {
            expectedMarkerView.frame.origin.x = 185
            expectedBar.backgroundColor = scale6
        } else if creationDistressLevel == 7 {
            expectedMarkerView.frame.origin.x = 215
            expectedBar.backgroundColor = scale7
        } else if creationDistressLevel == 8 {
            expectedMarkerView.frame.origin.x = 235
            expectedBar.backgroundColor = scale8
        } else if creationDistressLevel == 9 {
            expectedMarkerView.frame.origin.x = 265
            expectedBar.backgroundColor = scale9
        } else if creationDistressLevel == 10 {
            expectedMarkerView.frame.origin.x = 285
            expectedBar.backgroundColor = scale10
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

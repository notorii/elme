//
//  AddStepsViewController.swift
//  elme
//
//  Created by Margaret Bignell on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class AddStepsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBOutlet weak var tableView: UITableView!
    var steps: [String]!
    var textField: [UITextField]!
    var cell: AddStepCell!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var AddStepsView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    let stepData = StepData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        closeButton.tintColor = mediumTextColor
        
        AddStepsView.backgroundColor = darkBackgroundColor
        AddStepsView.layer.borderColor = borderColor.CGColor
        AddStepsView.layer.borderWidth = 1.0
        AddStepsView.layer.cornerRadius = 4
        
        tableView.backgroundColor = darkBackgroundColor
        
        nextButton.backgroundColor = darkBackgroundColor
        nextButton.layer.cornerRadius = 4
        
        steps = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count + 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // save steps to temp storage
        for (index, cell) in tableView.visibleCells.enumerate() {
            let cell = cell as! AddStepCell
            if (cell.addStepTextField.text != "") {
                self.stepData.steps.append(["step_index": index, "description": cell.addStepTextField.text!])
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCellWithIdentifier("AddStepCell") as! AddStepCell

        cell.addStepTextField.delegate = self
        if indexPath.row > 4 {
            print("greater than six")
        }
        cell.stepNumberLabel.textColor = darkTextColor
        cell.backgroundColor = lightBackgroundColor
        cell.topBorder.backgroundColor = borderColor
        cell.bottomBorder.hidden = true
        
        if indexPath.row == steps.count {
            cell.bottomBorder.hidden = false
            cell.bottomBorder.backgroundColor = borderColor
        }
        
        let stepField = cell.addStepTextField as StepField
        stepField.index = indexPath.row
        cell.stepNumberLabel.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if cell.addStepTextField.text != "" {
            steps.append(cell.addStepTextField.text!)
        }
        
        cell.addStepTextField.resignFirstResponder()
        tableView.reloadData()
        return true
    }

    @IBAction func onClosePress(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("addStepsDismissed", object: nil)
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

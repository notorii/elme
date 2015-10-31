//
//  AddStepsViewController.swift
//  elme
//
//  Created by Margaret Bignell on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class AddStepsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var steps: [String]!
    var textField: [UITextField]!
    var cell: AddStepCell
    
    @IBOutlet weak var AddStepsView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        steps = ["cats"]
        
        AddStepsView.backgroundColor = lightBackgroundColor
        AddStepsView.layer.borderColor = borderColor.CGColor
        AddStepsView.layer.borderWidth = 1.0
        
        nextButton.backgroundColor = lightBackgroundColor
        nextButton.layer.borderColor = borderColor.CGColor
        nextButton.layer.borderWidth = 1.0

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCellWithIdentifier("AddStepCell") as! AddStepCell
        cell.addStepTextField.delegate = self
        var stepField = cell.addStepTextField as! StepField
        stepField.index = indexPath.row
        cell.stepNumberLabel.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        cell.addStepTextField.resignFirstResponder()
        steps.append(cell.addStepTextField.text!)
        print(steps)
        print("testing")
                if cell.addStepTextField.text == "" {
                    print("do nothing")
                } else {
                }
        
        tableView.reloadData()
        
        return true
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

//
//  StepListViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class StepListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var stepsTitleLabel: UILabel!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let CellIdentifier = "StepListCell"
    
    var steps: [String]!
    var checked: [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        steps = ["Cats","dogs","monkies monkies Donec ullamcorper nulla non metus auctor fringilla. Nullam id dolor id nibh ultricies vehicula ut id elit.","ponies"]

        checked = [Bool](count: steps.count, repeatedValue: false)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.backgroundColor = darkBackgroundColor
        navBarView.backgroundColor = lightBackgroundColor
        navBarView.layer.borderWidth = 1
        navBarView.layer.borderColor = borderColor.CGColor
        
        stepsTitleLabel.textColor = darkTextColor
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = darkBackgroundColor
        tableView.estimatedRowHeight = 4
        tableView.separatorColor = borderColor
        
        checked[0] = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackPress(sender: UIButton) {
     navigationController!.popViewControllerAnimated(true)
    }

    
    @IBAction func onListPress(sender: UIButton) {
        print("list press")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("something selected")
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        checked[indexPath.row] = !checked[indexPath.row]
//        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        //if checked, run segue to complete details view controller
        if checked[indexPath.row] == true {
            performSegueWithIdentifier("stepDetailsCompleteSegue", sender: self)
        }
        //if unchecked, run segue to incomplete view controller
        else {
            performSegueWithIdentifier("stepDetailsIncompleteSegue", sender: self)
        }
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("StepListCell") as! StepListCell
        
        //let steps = steps[indexPath.row]
        cell.checkmark.hidden = true
        cell.backgroundColor = lightBackgroundColor
        cell.stepTextLabel.textColor = darkTextColor
        cell.stepNumberLabel.textColor = darkTextColor
        cell.borderView.layer.borderColor = borderColor.CGColor
        cell.borderView.layer.borderWidth = 1
        
        
        if checked[indexPath.row] {
            cell.checkmark.hidden = false
            cell.stepNumberLabel.hidden = true
            cell.backgroundColor = darkBackgroundColor
        } else {
            cell.checkmark.hidden = true
            cell.stepNumberLabel.hidden = false
        }
        
        if indexPath.row == steps.count - 1 {
            cell.borderView.frame.size.height = 57
        }
        
        
        cell.stepTextLabel.text = steps[indexPath.row]
        cell.stepNumberLabel.text = "1"
        
        return cell
    }
//    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destinationViewController
        
        print(checked)
        destinationViewController.view.backgroundColor = UIColor.clearColor()
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.presentViewController(self, animated: true, completion: nil)
    }

}


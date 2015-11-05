//
//  StepListViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class StepListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var stepsTitleLabel: UILabel!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let CellIdentifier = "StepListCell"
    
    var steps: [String]!
    var checked = [Bool]()
    var goal: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        steps = []

        //setting up cell check mark stuff
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //setting styles
        view.backgroundColor = darkBackgroundColor
        navBarView.backgroundColor = lightBackgroundColor
        navBarView.layer.borderWidth = 1
        navBarView.layer.borderColor = borderColor.CGColor
        
        stepsTitleLabel.textColor = darkTextColor
        
        //setting up table view + styles
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = darkBackgroundColor
        tableView.estimatedRowHeight = 4
        tableView.separatorColor = borderColor
        
        
        var query1 = PFQuery(className: "Goal")
        query1.orderByDescending("createdAt")
        query1.limit = 1

        query1.findObjectsInBackgroundWithBlock {
            (goals: [PFObject]?, error: NSError?) -> Void in
            for goal in goals! {
                var query2 = PFQuery(className:"Step")
                query2.orderByAscending("createdAt")
                query2.whereKey("goal", equalTo: goal)
                query2.findObjectsInBackgroundWithBlock {
                    (objects: [PFObject]?, error: NSError?) -> Void in
                    var counter = 0
                    for object in objects! {
                        let stepsListItem = object["description"] as! String
                        self.steps.append(stepsListItem)
                        print(counter)
                        
                        if (object.objectForKey("completed_at") != nil) {
                            print("completed_at key exists for \(object["objectId"])")
                            self.checked.append(true)
                        } else {
                            print("completed_at key DOES NOT exist for \(object["objectId"])")
                            self.checked.append(false)
                        }
                        
                        counter++
                    }
                    self.tableView.reloadData()
                }
            }
            
        }
    
//        var query3 = PFQuery(className: "Step")
//        query3.orderByDescending("completedAt")
//
//        query3.findObjectsInBackgroundWithBlock {
//            (steps: [PFObject]?, error: NSError?) -> Void in
//            for step in steps! {
//                if step["completedAt"] != nil {
//                    checked[indexRow] = true
//                } else {
//                    checked[indexRow] = false
//                }
//            }
//        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //back press
    @IBAction func onBackPress(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }

    //list press action -> navigate to past goals view controller
    @IBAction func onListPress(sender: UIButton) {
        print("list press")

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        //picking up cell
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
       
        //addressing cell in this file
        var cell = tableView.dequeueReusableCellWithIdentifier("StepListCell") as! StepListCell
        
        //setting styles of cell
        cell.checkmark.hidden = true
        cell.backgroundColor = lightBackgroundColor
        cell.stepTextLabel.textColor = darkTextColor
        cell.stepNumberLabel.textColor = darkTextColor
        cell.borderView.layer.borderColor = borderColor.CGColor
        cell.borderView.layer.borderWidth = 1
        
//        checked = [Bool](count: steps.count, repeatedValue: false)

        
        //set up check marks on completed tasks
        if checked.count > 0 {
            if checked[indexPath.row] {
                cell.checkmark.hidden = false
                cell.stepNumberLabel.hidden = true
                cell.backgroundColor = darkBackgroundColor
            } else {
                cell.checkmark.hidden = true
                cell.stepNumberLabel.hidden = false
            }
        }
        
        //adjusting for border on last item in list
        if indexPath.row == steps.count - 1 {
            cell.borderView.frame.size.height = 57
        }
        
        //setting proper numbering to left of steps
        cell.stepTextLabel.text = steps[indexPath.row]
        cell.stepNumberLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destinationViewController
        

        if segue == "listPress" {
            
        } else {
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }

}


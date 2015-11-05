//
//  PastGoalsViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse

class PastGoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navBarView: UIView!
    var pastGoals: [String]!

    @IBOutlet weak var pastGoalsTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pastGoals = []
        
        view.backgroundColor = darkBackgroundColor
        tableView.backgroundColor = darkBackgroundColor
        
        navBarView.backgroundColor = lightBackgroundColor
        navBarView.layer.borderWidth = 1
        navBarView.layer.borderColor = borderColor.CGColor
        pastGoalsTitleLabel.textColor = darkTextColor
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 4
        
        var query = PFQuery(className:"Goal")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            print(objects)
            
            for object in objects! {
                print(object["fear_description"])
                let pastGoalTest = object["fear_description"] as! String
                print(pastGoalTest)
                self.pastGoals.append(pastGoalTest)
                print(self.pastGoals)
            }
            self.tableView.reloadData()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackPress(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("pastgoals = \(pastGoals.count)")
        return pastGoals.count - 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PastGoalViewCell") as! PastGoalViewCell
        
        cell.backgroundColor = lightBackgroundColor
        cell.pastGoalLabel.textColor = darkTextColor
        
        cell.borderView.layer.borderColor = borderColor.CGColor
        cell.borderView.layer.borderWidth = 1
        
        if indexPath.row == pastGoals.count - 2 {
            cell.borderView.frame.size.height = 55
        }
        
        cell.pastGoalLabel.text = pastGoals[indexPath.row + 1]
        
        return cell
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

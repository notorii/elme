//
//  PastGoalsViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class PastGoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navBarView: UIView!
    var pastGoals: [String]!

    @IBOutlet weak var pastGoalsTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pastGoals = ["one", "two", "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.", "four"]
        
        view.backgroundColor = lightBackgroundColor
        tableView.backgroundColor = lightBackgroundColor
        
        navBarView.backgroundColor = lightBackgroundColor
        navBarView.layer.borderWidth = 1
        navBarView.layer.borderColor = borderColor.CGColor
        pastGoalsTitleLabel.textColor = darkTextColor
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackPress(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastGoals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PastGoalViewCell") as! PastGoalViewCell
        
        cell.backgroundColor = lightBackgroundColor
        cell.pastGoalLabel.textColor = darkTextColor
        
        cell.pastGoalLabel.text = pastGoals[indexPath.row]
        
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

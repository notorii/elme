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
    
   var steps: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // navBarView.backgroundColor = lightBackgroundColor
        navBarView.layer.borderWidth = 1
        //navBarView.layer.borderColor = borderColor.CGColor
        
        //stepsTitleLabel.textColor = darkTextColor
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 4
        steps = ["Cats","dogs","monkies monkies Donec ullamcorper nulla non metus auctor fringilla. Nullam id dolor id nibh ultricies vehicula ut id elit.","ponies"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackPress(sender: UIButton) {
      //  navigationController!.popViewControllerAnimated(true)
        print("on back press")
    }

    
    @IBAction func onListPress(sender: UIButton) {
        print("list press")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("StepListCell") as! StepListCell
        
        //let steps = steps[indexPath.row]
        
        cell.stepTextLabel.text = steps[indexPath.row]
        cell.stepNumberLabel.text = "1"
        
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

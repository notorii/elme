//
//  AddStepsViewController.swift
//  elme
//
//  Created by Margaret Bignell on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class AddStepsViewController: UIViewController, UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //addStepsTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        //addStepsTextField.resignFirstResponder()
        print("testing")
//        if x.text == "" {
//            print("do nothing")
//        } else {
//            print("create new table view")
//            
//        }
        
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

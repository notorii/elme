//
//  EditProfileViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/26/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var onBackButton: UIButton!
    @IBOutlet weak var smokeScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //DELAY THING
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    //SIGN IN
    @IBAction func onSignIn(sender: AnyObject) {
        
        //SUCCESS
        if emailField.text == "" || passwordField.text == "" || nameField.text == "" {
            
            //SPINNER
            self.smokeScreen.hidden = false
            print("smoke")
            
            //DELAY
            delay(2){
                //self.performSegueWithIdentifier("editProfileSegue", sender: nil)
                navigationController!.popViewControllerAnimated(true)
            }
        }

    }
    
    //BACK BUTTON

    @IBAction func onBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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

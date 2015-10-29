//
//  LoginViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/28/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var accountSignUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var activityControllerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        accountSignUpButton.layer.borderWidth = 1
        accountSignUpButton.layer.borderColor = borderColor.CGColor
        accountSignUpButton.setTitleColor(mediumTextColor, forState: .Normal)
        accountSignUpButton.layer.cornerRadius = 4
       
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = borderColor.CGColor
        loginButton.setTitleColor(mediumTextColor, forState: .Normal)
        loginButton.layer.cornerRadius = 4
        */

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    @IBAction func onLogin(sender: AnyObject) {
        
        //SUCCESS EMAIL AND PASSWORD
        if usernameField.text == "email" && passwordField.text == "password" {
            
            // PUT SPINNER HERE SIGNNING IN...
            self.activityControllerView.hidden = false
            //loginButton.alpha = 0
            loginButton.setTitle("", forState: .Normal)
            
            // DELAY
            // Delay for 2 seconds, then run the code between the braces.
            delay(1) {
                
                //SEGUE
              self.performSegueWithIdentifier("loginSegue", sender: nil)
                
                
            }
        }
        
        //FAIL
        else{
            if usernameField.text!.isEmpty {
                
                let alert = UIAlertView (title: "Username not recognized", message: "Please enter your username", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
                
                //sign in failed
            else{
                let alert = UIAlertView (title: "Log In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
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

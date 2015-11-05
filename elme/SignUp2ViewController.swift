//
//  SignUp2ViewController.swift
//  elme
//
//  Created by Prime, Heather(AWF) on 10/28/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse


class SignUp2ViewController: UIViewController {

    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var onAccountLogInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = borderColor.CGColor
        signUpButton.setTitleColor(mediumTextColor, forState: .Normal)
        signUpButton.layer.cornerRadius = 4
        
        onAccountLogInButton.layer.borderWidth = 1
        onAccountLogInButton.layer.borderColor = borderColor.CGColor
        onAccountLogInButton.setTitleColor(mediumTextColor, forState: .Normal)
        onAccountLogInButton.layer.backgroundColor = buttonBackgroundColor.CGColor
        

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

   
    @IBAction func onLogIn(sender: AnyObject) {
        //navigationController!.popViewControllerAnimated(true)
    }
    @IBAction func onTermsButton(sender: AnyObject) {
    
    }
    @IBAction func signUpButton(sender: AnyObject) {
        
        var user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        // other fields can be set just like with PFObject
        user["fullName"] = fullNameField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                print(errorString)
            } else {
                // Hooray! Let them use the app now.
                print("success")
                // PUT SPINNER HERE SIGNNING IN...
                self.activityIndicatorView.hidden = false
                //loginButton.alpha = 0
                self.signUpButton.setTitle("", forState: .Normal)
                
                // Delay for 2 seconds, then run the code between the braces.
                self.delay(1) {
                
                    //SEGUE
                    self.performSegueWithIdentifier("SignUpSegue", sender: nil)
                                
                }

            }
        }
        
//        //SUCCESS EMAIL AND PASSWORD
//        if fullNameField.text == "name" && passwordField.text == "password" && emailField.text == "email" {
//            
//            // PUT SPINNER HERE SIGNNING IN...
//            self.activityIndicatorView.hidden = false
//            //loginButton.alpha = 0
//            signUpButton.setTitle("", forState: .Normal)
//            
//            // DELAY
//            // Delay for 2 seconds, then run the code between the braces.
//            delay(1) {
//                
//                //SEGUE
//                self.performSegueWithIdentifier("SignUpSegue", sender: nil)
//                
//            }
//        }
//            //FAIL
//        else{
//            if fullNameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty {
//                
//                let alert = UIAlertView (title: "Credentials Missing", message: "Please make sure you have filled out all the fields", delegate: nil, cancelButtonTitle: "OK")
//                alert.show()
//            }
//                
//                //sisgn in failed
//            else{
//                let alert = UIAlertView (title: "Sign Up Failed", message: "Incorrect Credentials", delegate: nil, cancelButtonTitle: "OK")
//                alert.show()
//            }
//        }
    
    
        
    }
    
  
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        keyboardDismiss()
    }
    
    func keyboardDismiss() {
        view.endEditing(true)
        print("tap gesture")
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

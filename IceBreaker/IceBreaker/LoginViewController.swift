//
//  LoginViewController.swift
//  IceBreaker
//
//  Created by Christopher Tischuk on 12/17/15.
//  Copyright © 2015 Christopher Tischuk. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningMessageLabel: UILabel!
    
    @IBAction func logInButton(sender: AnyObject) {
        warningMessageLabel.text = ""
        if (userNameTextField.text!.isEmpty && passwordTextField.text!.isEmpty) {
            //both fields missing
            warningMessageLabel.text = "Please enter a username and password"
        } else if userNameTextField.text!.isEmpty {
            //username missing
            warningMessageLabel.text = "Please enter a username"
        } else if passwordTextField.text!.isEmpty {
            //password missing
            warningMessageLabel.text = "Please enter a password"
        } else {
            //both fields non-empty, check validity
            let givenUsername = userNameTextField.text!
            let givenPassword = passwordTextField.text!
            
            PFUser.logInWithUsernameInBackground(givenUsername, password: givenPassword) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    print("successful login")
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                }
                else {
                    print("invalid login")
                    self.warningMessageLabel.text = "Invalid login"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
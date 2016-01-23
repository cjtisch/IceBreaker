//
//  SignUpViewController.swift
//  IceBreaker
//
//  Created by Christopher Tischuk on 1/10/16.
//  Copyright © 2016 Christopher Tischuk. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func birthdayTextFieldAction(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        birthdayTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    var textFields: [UITextField]!
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields = [firstNameTextField, lastNameTextField, usernameTextField, emailTextField, birthdayTextField, passwordTextField, confirmPasswordTextField]
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nextButton.hidden = !validateInputs()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func validateInputs() -> Bool {
        return !firstNameTextField.text!.isEmpty && !lastNameTextField.text!.isEmpty && !usernameTextField.text!.isEmpty && !emailTextField.text!.isEmpty && !birthdayTextField.text!.isEmpty && !passwordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty
    }
    
    @IBAction func next(sender: UIButton) {
        if let firstName = firstNameTextField.text, lastName = lastNameTextField.text, userName = usernameTextField.text, email = emailTextField.text, birthday = birthdayTextField.text, password = passwordTextField.text {
            let profile = Profile(username: userName, email: email, password: password, firstName: firstName, lastName: lastName, birthday: NSDate())

            //create a user object
            var user = PFUser()
            
            //required PFUser fields
            user.username = profile.username
            user.password = profile.password
            
            //optional PFUser field
            user.email = profile.email
            
            //custom PFUser fields
            user["birthday"]  = profile.birthday
            user["firstName"] = profile.firstName
            user["lastName"]  = profile.lastName
            
            activityIndicator.startAnimating()
            
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                self.activityIndicator.stopAnimating()
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                    var title = "Error"
                    var message = errorString as! String
                    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)

                } else {
                    var title = "Success"
                    var message = "Your account has been created. A verification message has been sent to your e-mail."
                    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: {(action) -> Void in
                            self.navigationController?.popViewControllerAnimated(true)
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                    //TODO would like to back out of the create account screen here, don't know how
                }
            })
        }
    }
}

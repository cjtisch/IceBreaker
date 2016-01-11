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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var textFields: [UITextField]!
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields = [firstNameTextField, lastNameTextField, emailTextField, birthdayTextField, passwordTextField, confirmPasswordTextField]
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
        return !firstNameTextField.text!.isEmpty && !lastNameTextField.text!.isEmpty && !emailTextField.text!.isEmpty && !birthdayTextField.text!.isEmpty && !passwordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty
    }
    
    @IBAction func next(sender: UIButton) {
        if let firstName = firstNameTextField.text, lastName = lastNameTextField.text, email = emailTextField.text, birthday = birthdayTextField.text, password = passwordTextField.text {
            let profile = Profile(email: email, password: password, firstName: firstName, lastName: lastName, birthday: NSDate())
            
            var parseProfile = PFObject(className:"Profile")
            
            parseProfile["firstName"] = profile.firstName
            parseProfile["lastName"] = profile.lastName
            parseProfile["email"] = profile.email
            parseProfile["birthday"] = profile.birthday
            parseProfile["password"] = profile.password
            
            parseProfile.saveInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    
                }
                else {
                    
                }
            })
        }
    }
}

//
//  ForgotPasswordViewController.swift
//  IceBreaker
//
//  Created by Mark Harvilla on 1/25/16.
//  Copyright © 2016 Christopher Tischuk. All rights reserved.
//

import UIKit
import Parse

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var warningNoticeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func exitButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func passwordResetButton(sender: AnyObject) {
        if emailAddressField.text!.isEmpty {
            warningNoticeLabel.text = "Enter a valid e-mail address"
        } else {
            warningNoticeLabel.text = ""
            self.view.endEditing(true)
            let emailResetTarget = emailAddressField.text!
            PFUser.requestPasswordResetForEmailInBackground(emailResetTarget)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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

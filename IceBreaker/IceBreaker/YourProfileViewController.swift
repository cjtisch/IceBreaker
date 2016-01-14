//
//  YourProfileViewController.swift
//  IceBreaker
//
//  Created by Mark Harvilla on 1/13/16.
//  Copyright © 2016 Christopher Tischuk. All rights reserved.
//

import UIKit
import Parse

class YourProfileViewController: UIViewController {

    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var userNameTextField: UILabel!
    @IBOutlet weak var emailTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let currentUser = PFUser.currentUser()
        let usersFirstName = currentUser?["firstName"] as! String
        let usersLastName  = currentUser?["lastName"] as! String
        
        nameTextField.text = usersFirstName + " " + usersLastName
        userNameTextField.text = currentUser?.username
        emailTextField.text = currentUser?.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

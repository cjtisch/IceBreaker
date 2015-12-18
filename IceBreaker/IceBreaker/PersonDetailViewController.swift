//
//  PersonDetailViewController.swift
//  IceBreaker
//
//  Created by Christopher Tischuk on 12/17/15.
//  Copyright © 2015 Christopher Tischuk. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    
    var personImage: UIImage?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        personImageView.layer.cornerRadius = 75
        personImageView.layer.masksToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        syncUI()
    }

    func syncUI() {
        nameLabel.text = name
        personImageView.image = personImage
    }
}

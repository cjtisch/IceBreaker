//
//  PersonTableViewCell.swift
//  IceBreaker
//
//  Created by Christopher Tischuk on 12/17/15.
//  Copyright © 2015 Christopher Tischuk. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageGenderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        personImageView.layer.cornerRadius = 25
        personImageView.layer.masksToBounds = true
    }
}

//
//  Profile.swift
//  IceBreaker
//
//  Created by Christopher Tischuk on 1/10/16.
//  Copyright © 2016 Christopher Tischuk. All rights reserved.
//

import Foundation
import CoreLocation

struct Profile {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var location: CLLocationCoordinate2D
    var birthday: NSDate
    var profileImageLink: String?
    var summary: String?
    
    init(email: String, password: String, firstName: String, lastName: String, location: CLLocationCoordinate2D, birthday: NSDate) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.location = location
        self.birthday = birthday
    }
}
//
//  PeopleNearbyViewController.swift
//  IceBreaker
//
//  Created by Christopher Tischuk on 12/17/15.
//  Copyright © 2015 Christopher Tischuk. All rights reserved.
//

import UIKit

class PeopleNearbyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let images = [UIImage(named: "Person1"), UIImage(named: "Person2"), UIImage(named: "Person3"), UIImage(named: "Person4"), UIImage(named: "Person5"), UIImage(named: "Person6"), UIImage(named: "Person7"), UIImage(named: "Person8"), UIImage(named: "Person9"), UIImage(named: "Person10")]
    let names = ["Sum R.", "Another Rgr.", "Barack O.", "Bruce J.", "Caitlyn J.", "Donald T.", "Elmo", "Jared L.", "Kim K.", "Scarlett J."]
    let ages = [25, 30, 50, 1, 2, 99, 2, 175, 66, 10]
    let genders = ["M", "F", "F", "F", "M", "M", "F", "F", "M", "F"]
    let cellIdentifier = "PersonTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PersonTableViewCell
        
        cell.personImageView.image = images[indexPath.row]
        cell.nameLabel.text = names[indexPath.row]
        cell.ageGenderLabel.text = "\(ages[indexPath.row]), \(genders[indexPath.row])"
        
        return cell
    }

    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let personDetailViewController = segue.destinationViewController as! PersonDetailViewController
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            personDetailViewController.name = names[selectedIndexPath.row]
            personDetailViewController.personImage = images[selectedIndexPath.row]
        }
    }
}

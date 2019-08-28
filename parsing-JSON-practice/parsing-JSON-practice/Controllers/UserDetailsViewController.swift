//
//  UserDetailsViewController.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        if let user = user {
            nameLabel.text = "\(user.name.first) \(user.name.last)"
            streetLabel.text = user.location.street
            cityLabel.text = user.location.city
            stateLabel.text = user.location.state
            zipLabel.text = "\(user.location.postcode)"
            phoneLabel.text = "Phone: \(user.phone)"
            birthdateLabel.text = "DOB: \(user.dob.date)"
        }
    }

}

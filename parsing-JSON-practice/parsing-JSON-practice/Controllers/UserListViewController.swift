//
//  UserListViewController.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

class UserListViewController: UIViewController {
    var users = [User]() {
        didSet {
            userListTableView.reloadData()
        }
    }
    
    @IBOutlet weak var userListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadJSONData()
    }
    
    private func configureTableView() {
        userListTableView.delegate = self
        userListTableView.dataSource = self
    }
    
    private func loadJSONData() {
        guard let pathToUserJSONFile = Bundle.main.path(forResource: "users", ofType: "json") else {
            fatalError("Couldn't find JSON file")
        }
        
        let internalURL = URL(fileURLWithPath: pathToUserJSONFile)
        do {
            let userData = try Data(contentsOf: internalURL)
            let usersFromJSON = try
                User.getUsers(from: userData)
            users = usersFromJSON
        } catch {
            fatalError("\(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "userCellToDetailsSegue" else { fatalError("Incorrect segue identifier")}
        
        guard let selectedIndexPath = self.userListTableView.indexPathForSelectedRow else {
            fatalError("No row was selected")
        }
        guard let userDetailVC = segue.destination as? UserDetailsViewController else {
            fatalError("No destination VC")
        }
        userDetailVC.user = users[selectedIndexPath.row]
        
    }
    
}

extension UserListViewController: UITableViewDelegate {}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = userListTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        cell.textLabel?.text = "\(user.name.first) \(user.name.last)"
        cell.detailTextLabel?.text = user.email
        return cell
    }
}

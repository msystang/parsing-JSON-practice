//
//  CitiesListViewController.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/28/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {

    @IBOutlet weak var citiesListTableView: UITableView!
    
    var cities = [City]() {
        didSet {
            citiesListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadJSONData()

    }
    
    private func configureTableView() {
        citiesListTableView.delegate = self
        citiesListTableView.dataSource = self
    }
    
    private func loadJSONData() {
        guard let pathToCitiesJSONFile = Bundle.main.path(forResource: "cities", ofType: "json") else { fatalError("Couldn't find JSON file") }
        
        let internalURL = URL(fileURLWithPath: pathToCitiesJSONFile)
        do {
            let cityData = try Data(contentsOf: internalURL)
            let citiesFromJSON = try City.getCities(from: cityData)
            cities = citiesFromJSON
        } catch {
            fatalError("Couldn't get cities from JSON: \(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "cityCellToDetailsSegue" else { fatalError("Incorrect segue identifier") }
        
        guard let selectedIndexPath = self.citiesListTableView.indexPathForSelectedRow else { fatalError("No row was selected") }
        
        guard let cityDetailVC = segue.destination as? CityDetailsViewController else { fatalError("No destination VC") }
        
        cityDetailVC.city = cities[selectedIndexPath.row]
    }
    
    
    
}

extension CitiesListViewController: UITableViewDelegate {}

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cities[indexPath.row]
        let cell = citiesListTableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        cell.textLabel?.text = city.name
        return cell
    }
    
}

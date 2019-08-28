//
//  CityDetailsViewController.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/28/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class CityDetailsViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    @IBOutlet weak var cityWeatherLabel: UILabel!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        if let city = city {
            cityNameLabel.text = city.name
            cityTempLabel.text = "Temp: \(city.main.temp) F"
            cityWeatherLabel.text = "Weather: \(city.weather[0].description)"
        }
    }
 

}

//
//  ViewController.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController {

    var colors = [Color]() {
        didSet {
            colorListTableView.reloadData()
        }
    }
    
    @IBOutlet weak var colorListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
        loadJSONData()
    }

    private func configureTableView() {
        colorListTableView.delegate = self
        colorListTableView.dataSource = self
    }
    
    private func loadJSONData() {
        guard let pathToColorJSONFile = Bundle.main.path(forResource: "colors", ofType: "json") else {
            fatalError("Couldn't find JSON file")
        }
        
        let internalURL = URL(fileURLWithPath: pathToColorJSONFile)
        do {
            let colorData = try Data(contentsOf: internalURL)
            let colorsFromJSON = try
                Color.getColors(from: colorData)
            colors = colorsFromJSON
        } catch {
            fatalError("Couldn't get colors from JSON")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "colorCellToDetailsSegue" else { fatalError("Incorrect segue identifier")}
        
        guard let selectedIndexPath = self.colorListTableView.indexPathForSelectedRow else {
            fatalError("No row was selected")
        }
        guard let colorDetailVC = segue.destination as? ColorDetailsViewController else {
            fatalError("No destination VC")
        }
        
      colorDetailVC.color = colors[selectedIndexPath.row]
        
    }

}

extension ColorListViewController: UITableViewDelegate {}

extension ColorListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = colorListTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        var colorValues = color.rgb
        colorValues.convertValue()
        
        let red = CGFloat(colorValues.r)
        let green = CGFloat(colorValues.g)
        let blue = CGFloat(colorValues.b)
        
        cell.textLabel?.text = color.name.value
        // refactor later to convert to CGFloat
        cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(color.a))
        return cell
    }
}

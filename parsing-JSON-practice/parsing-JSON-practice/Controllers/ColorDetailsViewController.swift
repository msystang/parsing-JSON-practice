//
//  ColorDetailsViewController.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ColorDetailsViewController: UIViewController {

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var color: Color?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateLabels()
    }
    
    func updateLabels() {
        if let color = color {
            var colorValues = color.rgb
            colorValues.convertValue()
            
            let red = CGFloat(colorValues.r)
            let green = CGFloat(colorValues.g)
            let blue = CGFloat(colorValues.b)
            let hex = color.hex.value
            
            // refactor later to round digits
            redLabel.text = "Red: \(red)"
            greenLabel.text = "Green: \(green)"
            blueLabel.text = "Blue: \(blue)"
            hexLabel.text = "Hex: \(hex)"
        }
    }
    

}

//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bruno Guirra on 18/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var calculatedResult: String?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tipPercentage = tipPercentage, let numberOfPeople = numberOfPeople, let calculatedResult = calculatedResult {
            totalLabel.text = calculatedResult
            settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage) tip."
        }
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
}

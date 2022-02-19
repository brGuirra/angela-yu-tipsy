//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var selectedTip = 0.0
    var numberOfPeopleToSlitTheBill = 2.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        if let buttonTitle = sender.titleLabel?.text {
            // Remove "%"from the button title
            let formatedButtonTitle = buttonTitle.dropLast()
            
            let formatedButtonTitleAsNumber = Double(formatedButtonTitle)!
            
            selectedTip = formatedButtonTitleAsNumber / 100.0
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeopleToSlitTheBill = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
}


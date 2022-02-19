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
    var splitedBill = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Dismiss keyboard from UI
        billTextField.endEditing(true)
        
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
        // Dismiss keyboard from UI
        billTextField.endEditing(true)
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeopleToSlitTheBill = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let billTextFieldValue = billTextField.text {
            if let bill = Double(billTextFieldValue) {
                splitedBill = bill * (selectedTip + 1) / numberOfPeopleToSlitTheBill
                
                performSegue(withIdentifier: "goToResult", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            let tip = selectedTip * 100.0
            destinationVC.tipPercentage = String(format: "%.0f", tip) + "%"
            destinationVC.calculatedResult = String(format: "%.2f", splitedBill)
            destinationVC.numberOfPeople = String(format: "%.0f", numberOfPeopleToSlitTheBill)
        }
    }
}


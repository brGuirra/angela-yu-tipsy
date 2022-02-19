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
    
    var appBrain = AppBrain()
    var selectedButton: UIButton?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Dismiss keyboard from UI
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        selectedButton = sender
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // Dismiss keyboard from UI
        billTextField.endEditing(true)
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        appBrain.calculateBill(bill: billTextField.text, numberOfPeople: splitNumberLabel.text, tip: selectedButton?.currentTitle)
        
        if appBrain.bill != nil {
            performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            let ac = UIAlertController(title: "Error", message: "An error occurred while calculating the bill", preferredStyle: .alert
            )
            ac.addAction(UIAlertAction(title: "Try again", style: .cancel))
            present(ac, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.tipPercentage = appBrain.getTipPercentage()
            destinationVC.calculatedResult = appBrain.getBillValue()
            destinationVC.numberOfPeople = appBrain.getNumberOfPeople()
        }
    }
}


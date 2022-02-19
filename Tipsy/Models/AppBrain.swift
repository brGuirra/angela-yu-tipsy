//
//  AppBrain.swift
//  Tipsy
//
//  Created by Bruno Guirra on 19/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct AppBrain {
    var bill: Bill?
    
    mutating func calculateBill(bill: String?, numberOfPeople: String?, tip: String?) {
        let formatedBill = convertToDouble(value: bill)
        let formatedNumberOfPeople = convertToDouble(value: numberOfPeople)
        let formatedTip = formatTip(value: tip)
        
        if let formatedBill = formatedBill, let formatedNumberOfPeople = formatedNumberOfPeople, let formatedTip = formatedTip {
            let calculatedBill = formatedBill * (formatedTip + 1.0) / formatedNumberOfPeople
            
            self.bill = Bill(total: calculatedBill, numberOfPeople: formatedNumberOfPeople, tipPercentege: formatedTip)
        }
    }
    
    private func formatTip(value: String?) -> Double? {
        if let value = value {
            // Remove "%"from the value
            let formatedValue = value.dropLast()
            
            if let formatedValueAsNumber = Double(formatedValue) {
                return formatedValueAsNumber / 100.0
            }
        }
        
        return nil
    }
    
    private func convertToDouble(value: String?) -> Double? {
        if let value = value {
            if let valueAsNumber = Double(value) {
                return valueAsNumber
            }
        }
        
        return nil
    }
    
    func getBillValue() -> String? {
        if let billTotal = bill?.total {
            return String(format: "%.2f", billTotal)
        }
        
        return nil
    }
    
    func getTipPercentage() -> String? {
        if let tipPercentage = bill?.tipPercentege {
            let tip = tipPercentage * 100.0
            return String(format: "%.0f", tip) + "%"
        }
        
        return nil
    }
    
    func getNumberOfPeople() -> String? {
        if let numberOfPeople = bill?.numberOfPeople {
            return String(format: "%.0f", numberOfPeople)
        }
        
        return nil
    }
}

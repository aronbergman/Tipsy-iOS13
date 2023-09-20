//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var split: Double = 2
    
    @IBAction func tipChange(_ sender: UIButton) {
        let id = sender.restorationIdentifier!

        switch id {
        case "tenPctButton":
            print("0.1")
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        case "twentyPctButton":
            print("0.2")
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        case "zeroPctButton":
            print("0")
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        default:
            return
        }
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        split = sender.value
        splitNumberLabel.text = String(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}

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
    var tip: Double = 0
    var total: Double = 0
    var result: Double = 0
    
    @IBAction func tipChange(_ sender: UIButton) {
        billTextField.endEditing(true)
        let id = sender.restorationIdentifier!
        
        switch id {
        case "tenPctButton":
            tip = 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        case "twentyPctButton":
            tip = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        case "zeroPctButton":
            tip = 0
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
    
    @IBAction func billTextFiledAction(_ sender: UITextField) {
        let formatter = NumberFormatter()
        //        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let number = formatter.number(from: sender.text ?? "0")
        total = number as! Double
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        
        //In Main.storyboard there is a segue between CalculatorVC and ResultsVC with the identifier "goToResults".
        //This line triggers the segue to happen.
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResults" {
            var result = (total * tip) / split
            var resultFormatting = String(format:"%.2f", result)
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
            
            //Set the destination ResultsViewController's properties.
            destinationVC.result = resultFormatting
            destinationVC.tip = Int(tip)
            destinationVC.split = Int(split)
        }
    }
}

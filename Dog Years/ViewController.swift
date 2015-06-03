//
//  ViewController.swift
//  Dog Years
//
//  Created by Adam Cobb on 6/2/15.
//  Copyright (c) 2015 Adam Cobb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var convertedYearsLabel: UILabel!
    @IBOutlet weak var enterAgeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertToDogYears(sender: UIButton) {
        let numberOfYears: Int? = enterAgeTextField.text.toInt()
        let conversionFactor = 7
        
        if let yearsConst = numberOfYears {
            convertedYearsLabel.text = "\(yearsConst * conversionFactor)" + " years old in human years."
        }
        else {
            convertedYearsLabel.text = "Please enter a numerical whole number age!"
        }
        convertedYearsLabel.hidden = false
        
        enterAgeTextField.text = ""
        enterAgeTextField.resignFirstResponder()
    }

    @IBAction func convertToRealDogYears(sender: UIButton) {
        let firstTwoYears: Double = 21
        let firstTwoFactor: Double = 10.5
        let afterFirstTwoFactor: Double = 4
        
        let letters = NSCharacterSet.letterCharacterSet()
        var containsOnlyDecimalDigits = true
        
        let phrase = enterAgeTextField.text
        for uni in phrase.unicodeScalars  {
            if letters.longCharacterIsMember(uni.value) {
                containsOnlyDecimalDigits = false
                break
            }
        }
        
        if containsOnlyDecimalDigits {
            let numberOfYears: Double = Double((phrase as NSString).doubleValue)
            var calculatedAge: Double = 0
            if numberOfYears >= 2 {
                calculatedAge = firstTwoYears
                calculatedAge += ((numberOfYears - 2) * afterFirstTwoFactor)
            }
            else {
                calculatedAge = numberOfYears * firstTwoFactor
            }
            
            convertedYearsLabel.text = "\(calculatedAge)" + " years old in REAL human years."
            convertedYearsLabel.hidden = false
        }
        else {
            convertedYearsLabel.text = "Please enter a numerical age!"
            convertedYearsLabel.hidden = false
        }
        enterAgeTextField.text = ""
        enterAgeTextField.resignFirstResponder()
    }
}


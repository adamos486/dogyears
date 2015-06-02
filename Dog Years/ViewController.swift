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
        let numberOfYears = enterAgeTextField.text.toInt()!
        let conversionFactor = 7
        
        convertedYearsLabel.text = "\(numberOfYears * conversionFactor)" + " years old in dog years."
        convertedYearsLabel.hidden = false
        
        enterAgeTextField.text = ""
        enterAgeTextField.resignFirstResponder()
    }

}


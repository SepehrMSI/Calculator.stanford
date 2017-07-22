//
//  ViewController.swift
//  Calculator.stanford
//
//  Created by Sepehr's Cool Macbook on 6/25/17.
//  Copyright © 2017 Sepehr's Cool Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func clearBtn(_ sender: UIButton) {
        display.text = "0"
        displayValue = 0
    }
    
    @IBOutlet weak var display: UILabel!
    
    var UserIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if UserIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            
        } else {
            display.text = digit
            UserIsInTheMiddleOfTyping = true
        }
    }
    var displayValue: Double{
        get{
            return Double (display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain: CalculationBrain = CalculationBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if UserIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            UserIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result{
            displayValue = result
        }
    }
}




































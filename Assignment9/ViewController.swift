//
//  ViewController.swift
//  Assignment9
//
//  Created by Tekla on 10/22/23.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: Creating properties
    @IBOutlet private weak var stateLabel: UISwitch!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var firstNumberTextField: UITextField!
    @IBOutlet private weak var secondNumberTextField: UITextField!
    @IBOutlet private weak var calculateButton: UIButton!
    @IBOutlet private weak var outputLabel: UILabel!
  
    @IBAction private func switched(_ sender: Any) {
        textLabel.text = stateLabel.isOn ? "GCD" : "LCM"
    }
    
    @IBAction func calculateButtonDidTap(_ sender: Any) {
        /*
        if let x = num1.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            output.text = calculating()
        } else {
            output.text = "Please insert numbers."
        }
        */
        // Restricted text fields with number pads, but it did not work.
        if firstNumberTextField.hasText && secondNumberTextField.hasText {
            outputLabel.text = calculating()
        } else {
            outputLabel.text = "Please insert the numbers."
        }
    }
        
    private func calculating() -> String {
        stateLabel.isOn ? String(calculateGCD()) : String(calculateLCM())
    }

    private func calculateGCD() -> Int {
        var a = 0
        let firstNum = Int(firstNumberTextField.text!)
        let secondNum = Int(secondNumberTextField.text!)
        var b = max(firstNum!, secondNum!)
        var r = min(firstNum!, secondNum!)
            
        while r != 0 {
            a = b
            b = r
            r = a % b
            }
        return b
    }
    
    private func calculateLCM() -> Int {
        let firstNum = Int(firstNumberTextField.text!)
        let secondNum = Int(secondNumberTextField.text!)
        return firstNum!/calculateGCD()*secondNum!
    }
    
    
    
}


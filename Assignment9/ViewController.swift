//
//  ViewController.swift
//  Assignment9
//
//  Created by Tekla on 10/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Creating properties
    @IBOutlet weak var state: UISwitch!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    @IBAction func switched(_ sender: Any) {
        if state.isOn {
            text.text = "GCD"
        } else {
            text.text = "LCM"
        }
    }
    
    @IBAction func calculated(_ sender: Any) {
        /*
        if let x = num1.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            output.text = calculating()
        } else {
            output.text = "Please insert numbers."
        }
        */
        // Restricted text fields with number pads, but it did not work.
        if num1.hasText && num2.hasText {
        output.text = calculating()
        } else {
            output.text = "Please insert the numbers."
        }
    }
        
    func calculating() -> String {
        if state.isOn {
            return String(calculateGCD())
        } else {
            return String(calculateLCM())
        }
    }

    func calculateGCD() -> Int {
        var a = 0
        let firstNum = Int(num1.text!)
        let secondNum = Int(num2.text!)
        var b = max(firstNum!, secondNum!)
        var r = min(firstNum!, secondNum!)
            
        while r != 0 {
            a = b
            b = r
            r = a % b
            }
        return b
    }
    
    func calculateLCM() -> Int {
        let firstNum = Int(num1.text!)
        let secondNum = Int(num2.text!)
        return firstNum! / calculateGCD() * secondNum!
    }
    
    
    
}


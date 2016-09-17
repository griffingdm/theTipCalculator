//
//  ViewController.swift
//  theTipCalculator
//
//  Created by Mullins, Griffin on 9/16/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var tipPersonLabel: UILabel!
    

    @IBOutlet weak var splitController: UISegmentedControl!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        perPersonLabel.isHidden = true
        tipPersonLabel.isHidden = true
        billAmountField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func screenTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func clear(_ sender: AnyObject) {
        billAmountField.text = ""
        splitController.selectedSegmentIndex = 0
        tipPercentControl.selectedSegmentIndex = 1
        calculate(self)
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        let tipArray = [0.15, 0.2, 0.24]
        let splitArray = [1.0,2.0,3.0,4.0]
        let split = splitArray[splitController.selectedSegmentIndex]
        
        if splitController.selectedSegmentIndex > 0 {
            perPersonLabel.isHidden = false
            tipPersonLabel.isHidden = false
        } else {
            perPersonLabel.isHidden = true
            tipPersonLabel.isHidden = true
        }
        
        let bill = Double(billAmountField.text!) ?? 0
        let tip = bill * (tipArray[tipPercentControl.selectedSegmentIndex])
        let total = bill + tip
        
        tipAmount.text = String(format: "$%.2f", tip/split)
        totalAmount.text = String(format: "$%.2f", total/split)
    }
}


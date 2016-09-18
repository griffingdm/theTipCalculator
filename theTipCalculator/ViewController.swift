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
    @IBOutlet weak var bgView: UIView!
    

    @IBOutlet weak var splitController: UISegmentedControl!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        perPersonLabel.alpha = 0
        tipPersonLabel.alpha = 0
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
        
        let bgColor = bgView.backgroundColor
        bgView.backgroundColor = UIColor.white
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { 
            self.bgView.backgroundColor = bgColor
        })
        calculate(self)
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        let tipArray = [0.15, 0.2, 0.24]
        let splitArray = [1.0,2.0,3.0,4.0]
        let split = splitArray[splitController.selectedSegmentIndex]
        
        if splitController.selectedSegmentIndex > 0 {
            UIView.animate(withDuration: 0.25, animations: { 
                self.perPersonLabel.alpha = 1
                self.tipPersonLabel.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.25, animations: {
                self.perPersonLabel.alpha = 0
                self.tipPersonLabel.alpha = 0
            })
        }
        
        let bill = Double(billAmountField.text!) ?? 0
        let tip = bill * (tipArray[tipPercentControl.selectedSegmentIndex])
        let total = bill + tip
        
        tipAmount.text = String(format: "$%.2f", tip/split)
        totalAmount.text = String(format: "$%.2f", total/split)
    }
}


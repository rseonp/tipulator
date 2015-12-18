//
//  ViewController.swift
//  tips
//
//  Created by Victor Li Wang on 12/15/15.
//  Copyright © 2015 victorliwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder();
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        
        var tipPercentages = [0.15, 0.18, 0.20]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if let billAmount = Double(billField.text!) {
            let tip = billAmount * tipPercentage
            let total = billAmount + tip
            tipLabel.text = "$\(tip)"
            totalLabel.text = "$\(total)"
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else{
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.20]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if let billAmount = Double(billField.text!) {
            let tip = billAmount * tipPercentage
            let total = billAmount + tip
            tipLabel.text = "$\(tip)"
            totalLabel.text = "$\(total)"
        
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else{
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


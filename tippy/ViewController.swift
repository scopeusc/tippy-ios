//
//  ViewController.swift
//  tippy
//
//  Created by Zachary West Guo on 9/13/16.
//  Copyright © 2016 zechariah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var singleTotalLabel: UILabel!
    @IBOutlet weak var doubleTotalLabel: UILabel!
    @IBOutlet weak var tripleTotalLabel: UILabel!
    @IBOutlet weak var quadTotalLabel: UILabel!
    
    @IBOutlet weak var lightGreen: UIView!
    
    @IBOutlet weak var darkGreen: UIView!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    //var tipValue = 0.0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        self.darkGreen.alpha = 0
        self.tipControl.alpha = 0
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
//        let defaults = NSUserDefaults.standardUserDefaults()
//        tipValue = defaults.doubleForKey("default_tip_percentage")
//        tipControl.setTitle("\(tipValue)%", forSegmentAtIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Optionally initialize the property to a desired starting value

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.2, 0.25];
        //tipPercentages[0] = tipValue
        
        
        let bill = Double(billField.text!) ?? 0;
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex];
        let singleTotal = bill + tip;
        let doubleTotal = singleTotal/2;
        let tripleTotal = singleTotal/3;
        let quadTotal = singleTotal/4
        
        tipLabel.text = String(format: "$%.2f", tip);
        singleTotalLabel.text = String(format: "$%.2f", singleTotal);
        doubleTotalLabel.text = String(format: "$%.2f", doubleTotal);
        tripleTotalLabel.text = String(format: "$%.2f", tripleTotal);
        quadTotalLabel.text = String(format: "$%.2f", quadTotal);
    }
    
    @IBAction func editingBegin(sender: AnyObject) {
        
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.darkGreen.alpha = 1
            self.tipControl.alpha = 1
        })
        
    }

    @IBAction func onTapTop(sender: AnyObject) {
        view.endEditing(true);
    }
    


}


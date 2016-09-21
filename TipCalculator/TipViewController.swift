//
//  TipViewController.swift
//  TipCalculator
//
//  Created by TRUNG on 9/10/16.
//  Copyright © 2016 Trung. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipCalc = TipCalculator()
    
    override func viewWillAppear(_ animated: Bool) {
        /*
         let button = UIButton.init(type: .custom)
         button.setImage(UIImage.init(named: "Settings-100.png"), for: UIControlState.normal)
         button.addTarget(self, action:#selector(self.callMethod), for: UIControlEvents.touchUpInside)
         button.frame = CGRect.init(x: 0, y: 0, width: 23, height: 23)
         let barButton = UIBarButtonItem.init(customView: button)
         self.navigationItem.rightBarButtonItem = barButton
         */
        
        setupSegmentedControl(tipControl)
        calculateTip(self)
        
        billTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Style.loadTheme()
        
        //billTextField.resignFirstResponder()
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        tipCalc.Bill = Double(billTextField.text!) ?? 0
        tipCalc.TipPercentIndex = tipControl.selectedSegmentIndex
        
        tipLabel.text = String(format: "$%.2f", tipCalc.TipAmount)
        totalLabel.text = String(format: "$%.2f", tipCalc.Total)
    }
    
    func setupSegmentedControl(_ control: UISegmentedControl){
        control.removeAllSegments()
        let percentArr = Settings.GetDefaultPercentArray()
        for i in 0..<percentArr.count {
            control.insertSegment(withTitle: "\(percentArr[i])%", at: i, animated: false)
        }
        control.selectedSegmentIndex = Settings.GetDefaultPercentIndex()
    }
    
    
    func callMethod(){
        let settingsController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        //settingsController.delegate = self
        self.navigationController?.pushViewController(settingsController, animated: true)
    }
    
}


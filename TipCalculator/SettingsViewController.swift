//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by TRUNG on 9/10/16.
//  Copyright © 2016 Trung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()
    
    @IBOutlet weak var DefaultLabel: UILabel!
    
    @IBOutlet weak var DefaultView: UIView!
    
    @IBOutlet weak var ViewSplitter: UIView!
    
    @IBOutlet weak var ColorThemeLabel: UILabel!
    
    @IBOutlet weak var ColorView: UIView!
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBOutlet weak var stepper0: UIStepper!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    
    @IBOutlet weak var colorSwitch: UISwitch!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSegmentedControl(defaultTipControl)
        setupThemeSwitch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Style.loadTheme()
        
        //self.navigationController?.popToRootViewControllerAnimated(true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDefaultValue(_ sender: UISegmentedControl) {
        Settings.SetDefaultPercentIndex(sender.selectedSegmentIndex)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        Settings.SetDefaultPercentForIndex(sender.tag, percent: Int(sender.value))
        defaultTipControl.setTitle("\(Int(sender.value).description)%", forSegmentAt: sender.tag)
    }
    
    @IBAction func colorChanged(_ sender: AnyObject) {
        
        // Fade out to set the text
        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.ColorThemeLabel.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                if self.colorSwitch.isOn {
                    Style.themeLight()
                    self.ColorThemeLabel.text = "Light"
                } else {
                    Style.themeDark()
                    self.ColorThemeLabel.text = "Dark"
                }
                
                Style.saveTheme(themeName: self.ColorThemeLabel.text!)
                self.ApplyColorTheme(self.ColorThemeLabel.text!)
                
                // Fade in
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.ColorThemeLabel.alpha = 1.0
                    }, completion: nil)
        })
    }
    
    func setupSegmentedControl(_ control: UISegmentedControl){
        control.removeAllSegments()
        let percentArr = Settings.GetDefaultPercentArray()
        for i in 0..<percentArr.count {
            control.insertSegment(withTitle: "\(percentArr[i])%", at: i, animated: false)
            
            switch i {
            case 0: stepper0.value = Double(percentArr[i])
            break;
            case 1: stepper1.value = Double(percentArr[i])
            break;
            case 2: stepper2.value = Double(percentArr[i])
            break;
            default: ()
            break;
            }
        }
        control.selectedSegmentIndex = Settings.GetDefaultPercentIndex()
    }
    
    func setupThemeSwitch(){
        if let defaultThemeName = Settings.GetDefaultTheme(){
            if defaultThemeName == "Light" {
                self.ColorThemeLabel.text = "Light"
                Style.themeLight()
                colorSwitch.setOn(true, animated: true)
            }else{
                self.ColorThemeLabel.text = "Dark"
                Style.themeDark()
                colorSwitch.setOn(false, animated: false)
            }
            self.ApplyColorTheme(defaultThemeName)
        }
    }
    
    func ApplyColorTheme(_ color:String){
        self.view.backgroundColor = Style.sectionHeaderBackgroundColor
        self.DefaultLabel.textColor = Style.sectionHeaderTitleColor
        self.DefaultLabel.textColor = Style.sectionHeaderTitleColor
        self.ColorThemeLabel.textColor = UIColor.red//Style.sectionHeaderTitleColor
    }
}

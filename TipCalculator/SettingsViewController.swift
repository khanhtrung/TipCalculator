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
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var ViewSplitter: UIView!
    @IBOutlet weak var stepper0: UIStepper!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    
    @IBOutlet weak var ColorLabel: UILabel!
    @IBOutlet weak var ColorView: UIView!
    @IBOutlet weak var ColorThemeNameLabel: UILabel!
    @IBOutlet weak var colorSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        Style.loadTheme()
        setupSegmentedControl(defaultTipControl)
        setupThemeSwitch()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Style.loadTheme()
        //self.navigationController?.popToRootViewControllerAnimated(true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDefaultValue(_ sender: UISegmentedControl) {
        Settings.SetDefaultPercentIndex(sender.selectedSegmentIndex)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        /*var validValue = false
        switch sender.tag {
        case stepper0.tag:
            if (sender.value == stepper1.minimumValue)
            {
                sender.value = sender.minimumValue
            }
            if (sender.value > 0 && sender.value < stepper1.value)
            {
                stepper1.minimumValue = sender.value

                validValue = true
                break
            }
        case stepper1.tag:
            if (sender.value == stepper1.maximumValue)
            {
                sender.value = sender.minimumValue
            }
            if (sender.value == stepper2.minimumValue)
            {
                sender.value = sender.maximumValue
            }
            if (sender.value > stepper0.value && sender.value < stepper2.value)
            {
                stepper0.maximumValue = sender.value
                stepper2.minimumValue = sender.value
                
                validValue = true
                break
            }
        case stepper2.tag:
            if (sender.value == stepper1.maximumValue)
            {
                sender.value = sender.minimumValue
            }
            if (sender.value > stepper1.value)
            {
                stepper1.maximumValue = sender.value
                
                validValue = true
                break
            }
        default:
            break
        }
        if validValue
        {
            Settings.SetDefaultPercentForIndex(sender.tag, percent: Int(sender.value))
            defaultTipControl.setTitle("\(Int(sender.value).description)%", forSegmentAt: sender.tag)
        }
        */
        Settings.SetDefaultPercentForIndex(sender.tag, percent: Int(sender.value))
        defaultTipControl.setTitle("\(Int(sender.value).description)%", forSegmentAt: sender.tag)
    }
    
    @IBAction func colorChanged(_ sender: AnyObject) {
        // Fade out to set the text
        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.ColorThemeNameLabel.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                if self.colorSwitch.isOn {
                    Style.themeLight()
                    self.ColorThemeNameLabel.text = Style.THEME_LIGHT
                } else {
                    Style.themeDark()
                    self.ColorThemeNameLabel.text = Style.THEME_DARK
                }
                
                Style.saveTheme(themeName: self.ColorThemeNameLabel.text!)
                self.ApplyColorTheme()
                
                // Fade in
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.ColorThemeNameLabel.alpha = 1.0
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
            if defaultThemeName == Style.THEME_LIGHT {
                self.ColorThemeNameLabel.text = Style.THEME_LIGHT
                Style.themeLight()
                colorSwitch.setOn(true, animated: true)
            }else{
                self.ColorThemeNameLabel.text = Style.THEME_DARK
                Style.themeDark()
                colorSwitch.setOn(false, animated: false)
            }
            self.ApplyColorTheme()
        }
    }
    
    func ApplyColorTheme(){
        view.backgroundColor = Style.backgroundColor
        
        DefaultLabel.textColor = Style.textColor
        DefaultView.backgroundColor = Style.viewBackgroundColor
        //defaultTipControl.backgroundColor = Style.headerBackgroundColor
        ViewSplitter.backgroundColor = Style.backgroundColor
        
        //stepper0.tintColor = Style.headerTitleColor
        //stepper1.tintColor = Style.headerTitleColor
        //stepper2.tintColor = Style.headerTitleColor
        
        ColorLabel.textColor = Style.textColor
        ColorView.backgroundColor = Style.viewBackgroundColor
        ColorThemeNameLabel.textColor = Style.themeNameColor
    }
}

//
//  Settings.swift
//  TipCalculator
//
//  Created by TRUNG on 9/11/16.
//  Copyright © 2016 Trung. All rights reserved.
//

import Foundation

private let defaultPercentArray:[Int] = [10, 15, 20]
private let defaultPercentIndexKey  = "TipCalculator_DefaultPercentageIndex"
private let defaultPercentArrayKey  = "TipCalculator_DefaultPercentageArray"
private let defaultThemeKey         = "TipCalculator_DefaultThemeKey"
private let defaultBillTimeKey      = "TipCalculator_DefaultBillTimeKey"
private let defaultBillAmtKey       = "TipCalculator_DefaultBillAmtKey"


struct Settings {
    
    static func GetDefaultPercentArray()-> Array <Int> {
        if let array = UserDefaults.standard.object(forKey: defaultPercentArrayKey) as? [Int] {
            return array
        } else {
            return defaultPercentArray
        }
    }
    
    static func SetDefaultPercentArray(){
        SetDefaultPercentArray(GetDefaultPercentArray())
    }
    
    fileprivate static func SetDefaultPercentArray(_ array: [Int]){
        UserDefaults.standard.set(array, forKey: defaultPercentArrayKey)
    }
    
    static func GetDefaultPercentIndex()-> Int {
        return UserDefaults.standard.integer(forKey: defaultPercentIndexKey)
    }
    
    static func SetDefaultPercentIndex(_ index: Int) {
        UserDefaults.standard.set(index, forKey: defaultPercentIndexKey)
    }
    
    static func GetSelectedPercentValue()->Float {
        return GetPercentByIndex(GetDefaultPercentIndex())
    }
    
    static func GetPercentByIndex(_ index: Int)->Float {
        var percentArrayB = GetDefaultPercentArray()
        return Float(percentArrayB[index])/100
    }
    
    static func SetDefaultPercentForIndex(_ index: Int, percent Percent: Int) {
        var percentArrayB = GetDefaultPercentArray()
        percentArrayB[index] = Percent
        SetDefaultPercentArray(percentArrayB)
    }
    
    static func GetDefaultTheme()-> String! {
        return UserDefaults.standard.string(forKey: defaultThemeKey)
    }
    
    static func SetDefaultTheme(themeName: String){
        UserDefaults.standard.set(themeName, forKey: defaultThemeKey)
    }
    
    
    static func GetDefaultBillTime() -> NSDate{
        if let time = UserDefaults.standard.object(forKey: defaultBillTimeKey) as? NSDate{
            return time
        }
        else
        {return NSDate() }

    }
    
    static func SetDefaultBillTime(billTime: NSDate){
        UserDefaults.standard.set(billTime, forKey: defaultBillTimeKey)
    }
    
    static func GetDefaultBillAmount()-> Double {
        let billTime = GetDefaultBillTime()
        if (NSDate.timeIntervalSinceReferenceDate - billTime.timeIntervalSinceReferenceDate < 10*60 ){
            return UserDefaults.standard.double(forKey: defaultBillAmtKey)
        }
        return 0
    }
    
    static func SetDefaultBillAmount(billAmount: Double){
        SetDefaultBillTime(billTime: NSDate())
        UserDefaults.standard.set(billAmount, forKey: defaultBillAmtKey)
    }
}

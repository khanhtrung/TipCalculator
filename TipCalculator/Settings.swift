//
//  Settings.swift
//  TipCalculator
//
//  Created by TRUNG on 9/11/16.
//  Copyright © 2016 Trung. All rights reserved.
//

import Foundation

private let defaultPercentIndexKey  = "TipCalculator_DefaultPercentageIndex"
private let defaultPercentArrayKey  = "TipCalculator_DefaultPercentageArray"
private let defaultThemeKey         = "TipCalculator_DefaultThemeKey"
private let defaultPercentArray:[Int] = [10, 15, 20]

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
    
}

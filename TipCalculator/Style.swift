//
//  Style.swift
//  Tip
//
//  Created by TRUNG on 9/21/16.
//  Copyright © 2016 Trung. All rights reserved.
//

import Foundation
import UIKit



struct Style{
    
    static let THEME_LIGHT  = "Light"
    static let THEME_DARK   = "Dark"
    
    static var sectionHeaderTitleFont = UIFont(name: "Helvetica-Bold", size: 20)
    static var sectionHeaderTitleColor = UIColor.white
    static var sectionHeaderBackgroundColor = UIColor.black
    static var sectionHeaderBackgroundColorHighlighted = UIColor.gray
    static var sectionHeaderAlpha: CGFloat = 1.0
    
    static let light_TextColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
    static let light_ViewBackgroundColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    static let light_BackgroundColor = UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
    
    
    static let dark_TextColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    static let dark_ViewBackgroundColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    static let dark_BackgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
    
    static let availableThemes = [THEME_LIGHT, THEME_DARK]
    
    static func loadTheme(){
        if let name = Settings.GetDefaultTheme(){
            // Select the Theme
            if name == THEME_LIGHT  { themeLight()	}
            if name == THEME_DARK   { themeDark()	}
        }else{
            Settings.SetDefaultTheme(themeName: THEME_LIGHT)
            themeLight()
        }
    }
    
    static func saveTheme(themeName: String){
        Settings.SetDefaultTheme(themeName: themeName)
    }
    
    static func themeLight(){
        sectionHeaderTitleFont = UIFont(name: "Helvetica", size: 18)
        sectionHeaderTitleColor = light_TextColor
        sectionHeaderBackgroundColor = light_BackgroundColor
        sectionHeaderBackgroundColorHighlighted = UIColor.lightGray
        sectionHeaderAlpha = 0.8
    }
    
    static func themeDark(){
        sectionHeaderTitleFont = UIFont(name: "Helvetica", size: 18)
        sectionHeaderTitleColor = dark_TextColor
        sectionHeaderBackgroundColor = dark_BackgroundColor
        sectionHeaderBackgroundColorHighlighted = UIColor.lightGray
        sectionHeaderAlpha = 0.8
    }
}

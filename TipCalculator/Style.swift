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
    //static let availableThemes = [THEME_LIGHT, THEME_DARK]
    static let THEME_LIGHT  = "Light"
    static let THEME_DARK   = "Dark"
    static let textFont = UIFont(name: "Helvetica", size: 18)
    static var textColor = UIColor.black
    static var themeNameColor = UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
    static var backgroundColor = UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
    static var viewBackgroundColor = UIColor.white
    
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
        /*textColor = UIColor.black
        themeNameColor = UIColor.init(red: 0/255.0, green: 255/255.0, blue: 128/255.0, alpha: 1.0)
        backgroundColor = UIColor.init(red: 0/255.0, green: 255/255.0, blue: 128/255.0, alpha: 1.0)
        //UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
        viewBackgroundColor = UIColor.white*/
        
        textColor = UIColor.black
        themeNameColor = UIColor.init(red: 102/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
        backgroundColor = UIColor.init(red: 102/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
        viewBackgroundColor = UIColor.white
    }
    
    static func themeDark(){
        textColor = UIColor.init(red: 0/255.0, green: 255/255.0, blue: 128/255.0, alpha: 1.0)
        themeNameColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        viewBackgroundColor = UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
    }
}

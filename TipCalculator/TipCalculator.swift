//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by TRUNG on 9/11/16.
//  Copyright © 2016 Trung. All rights reserved.
//

import Foundation

struct TipCalculator {
    fileprivate var _defaultPercentages : Float = 0
    fileprivate var _tipPercentIndex : Int = 0
    fileprivate var _tipPercent : Float = 0
    fileprivate var _bill: Double = 0
    fileprivate var _tipAmount: Double = 0
    fileprivate var _total : Double = 0
    
    var DefaultPercentages : Float {
        set { _defaultPercentages = newValue }
        get { return _defaultPercentages }
    }
    
    var TipPercentIndex : Int {
        set { _tipPercentIndex = newValue
            TipPercent = calculateTipPercent()}
        get { return _tipPercentIndex }
    }
    
    var TipPercent : Float {
        set { _tipPercent = newValue
            TipAmount = calculateTipAmount()}
        get { return _tipPercent }
    }
    
    var Bill : Double {
        set { _bill = newValue}
        get { return _bill }
    }
    
    var TipAmount : Double {
        set { _tipAmount = newValue
            Total = calculateTotal()}
        get { return calculateTipAmount() }
    }
    
    var Total : Double {
        set { _total = newValue }
        get { return _total }
    }
    
    init(){}
    
    fileprivate func calculateTipPercent() -> Float{
        return Settings.GetPercentByIndex(_tipPercentIndex)
    }
    
    fileprivate func calculateTipAmount() -> Double{
        return _bill * Double(_tipPercent)
    }
    
    fileprivate func calculateTotal()-> Double{
        return _bill + _tipAmount
    }
}

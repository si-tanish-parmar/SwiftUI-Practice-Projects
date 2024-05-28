//
//  Double+Ext.swift
//  ProductDemo
//
//  Created by Tanish Parmar on 26/04/24.
//

import Foundation

extension Double{
    func toString() -> String{
        return String(format: "%.1f", self)
    }
    
    func currenctFormat() -> String{
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

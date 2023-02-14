//
//  Double.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import Foundation

extension Double {
    
    /// Converts a double into a currency with 2-6 decimal places
    ///  ```
    ///     Convert 1234.56 to $1,234.56
    ///  ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current  // default value of locale
//        formatter.currencyCode = "usd" // change currency
//        formatter.currencySymbol = "$" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a double into a currency as a String with 2-6 decimal places
    ///  ```
    ///     Convert 1234.56 to "$1,234.56"
    ///  ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a double into a currency with 2-6 decimal places
    ///  ```
    ///     Convert 1234.56 to $1,234.56
    ///     Convert 12.3456 to $12.3456
    ///     Convert 0.123456 to $0.1234.56
    ///  ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current  // default value of locale
//        formatter.currencyCode = "usd" // change currency
//        formatter.currencySymbol = "$" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a double into a currency as a String with 2-6 decimal places
    ///  ```
    ///     Convert 1234.56 to "$1,234.56"
    ///     Convert 12.3456 to "$12.3456"
    ///     Convert 0.123456 to "$0.1234.56"
    ///  ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    /// Converts a double into a currency as a String with 2-6 decimal places
    ///  ```
    ///     Convert 1.2345 to "1.23"
    ///  ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a double into a currency as a String with 2-6 decimal places
    ///  ```
    ///     Convert 1.2345 to "1.23%"
    ///  ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

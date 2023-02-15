//
//  Statistics.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-14.
//

import Foundation

// if used in loops or iteration need to conform to identifiable or hashable

struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}

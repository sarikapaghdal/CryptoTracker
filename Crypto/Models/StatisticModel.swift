//
//  StatisticModel.swift
//  Crypto
//
//  Created by Sarika on 12.05.22.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    //by default percentageChange will have nil value if we doen't pass its value in the initializer
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

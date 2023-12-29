//
//  Drink.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/29.
//

import Foundation

struct Drink: Codable {
    let name: String
    let description: String
    let series: String
    let price: [[String: String]]
    let canBeHeated: Bool
    
    init(name: String, description: String, series: String, price: [[String : String]], canBeHeated: Bool) {
        self.name = name
        self.description = description
        self.series = series
        self.price = price
        self.canBeHeated = canBeHeated
    }
}

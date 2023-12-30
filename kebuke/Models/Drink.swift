//
//  Drink.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/29.
//

import UIKit
import Foundation

struct Drink: Codable {
    let name: String
    let description: String
    let series: String
    let prices: [[String: String]]
    let canBeHeated: Bool
    
    init(name: String, description: String, series: String, prices: [[String : String]], canBeHeated: Bool) {
        self.name = name
        self.description = description
        self.series = series
        self.prices = prices
        self.canBeHeated = canBeHeated
    }
    
    /**
     飲料圖片
     */
    func image() -> UIImage {
        return UIImage(named: "\(name)") ?? UIImage(named: "logo")!
    }
    
    func getPriceAmount(size: String) -> Int {
        let filtered = prices.filter { price in
            return price["label"] == size
        }
        
        if (filtered.isEmpty) {
            return 0
        }
        let priceString = filtered.first?["value"]
        
        return Int(priceString ?? "") ?? 0
    }
}

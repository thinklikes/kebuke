//
//  Order.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/29.
//

import Foundation

struct Order: Codable {
    var user: String = ""
    var drink: String = ""
    var size: String = ""
    var sugar: String = ""
    var temperature: String = ""
    var price: Int = 0
    
    init(user: String, drinkName: String, size: String, sugar: String, temperature: String) {
        self.user = user
        self.drink = drinkName
        self.size = size
        self.sugar = sugar
        self.temperature = temperature
        let drink = findDrink()
        self.price = drink?.getPriceAmount(size: size) ?? 0
    }

    init() {
    }
    
    func findDrink() -> Drink? {
        for (_, drinks) in GlobalConfig.drinks {
            for drink: Drink in drinks {
                if(drink.name == self.drink) {
                    return drink
                }
            }
        }
        
        return nil
    }
}

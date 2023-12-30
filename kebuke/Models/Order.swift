//
//  Order.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/29.
//

import Foundation

struct Order: Codable {
    let user: String
    let drinkName: String
    let size: String
    let sugar: String
    let temperature: String
    var price: Int = 0
    var drink: Drink?
    
    init(user: String, drinkName: String, size: String, sugar: String, temperature: String) {
        self.user = user
        self.drinkName = drinkName
        self.size = size
        self.sugar = sugar
        self.temperature = temperature
        self.drink = findDrink()
        self.price = self.drink?.getPriceAmount(size: size) ?? 0

    }
    
    func findDrink() -> Drink? {
        for (_, drinks) in GlobalConfig.drinks {
            for drink: Drink in drinks {
                if(drink.name == self.drinkName) {
                    return drink
                }
            }
        }
        
        return nil
    }
}

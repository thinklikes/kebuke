//
//  Order.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/29.
//

import Foundation

struct Order {
    let user: String
    var drink: Drink?
    let drinkName: String
    let size: String
    let sugar: String
    let temperature: String
    let price: Int
    
    init(user: String, drinkName: String, size: String, sugar: String, temperature: String, price: Int) {
        self.user = user
        self.drinkName = drinkName
        self.size = size
        self.sugar = sugar
        self.temperature = temperature
        self.price = price
        self.drink = findDrink()
    }
    
    func findDrink() -> Drink? {
        for (_, drinks) in GlobalConfig.drinks {
            for drink: Drink in drinks {
                if(drink.name == self.drinkName) {
                    self.drink = Optional(drink)
                    break
                }
            }
        }
        
        return nil
    }
}

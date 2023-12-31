//
//  Record.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/31.
//

import Foundation

struct Record: Codable {
    let fields: Order
    
    init(order: Order) {
        self.fields = order
    }
}

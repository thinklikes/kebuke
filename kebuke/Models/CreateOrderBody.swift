//
//  CreateOrderBody.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/30.
//

import Foundation

struct CreateOrderBody: Codable {
    let records: [Order]
    
    init(records: [Order]) {
        self.records = records
    }
}

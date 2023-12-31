//
//  CreateOrderBody.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/30.
//

import Foundation

struct CreateOrderRequestBody: Encodable {
    let records: [Record]
    
    init(order: Order) {
        self.records = [Record(order: order)]
    }
}

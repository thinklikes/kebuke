//
//  GetOrdersResponseBody.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/31.
//

import Foundation

struct GetOrdersResponseBody: Decodable {
    let records: [Record]
}

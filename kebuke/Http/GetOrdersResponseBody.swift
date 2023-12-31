//
//  GetOrdersResponseBody.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/31.
//

import Foundation

struct GetOrdersResponseBody: Decodable {
    let records: [Record]
    
    // 如果有下一頁, 把這一項帶到 request 中
    var offset: String = ""
}

//
//  UIUpdatable.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/27.
//

import Foundation

protocol HttpDelegate {
    func httpClient(httpClient: HttpClient, GetOrders section: Int)
    func httpClient(httpClient: HttpClient, CreateOrder section: Int)
}

extension HttpDelegate {
    func httpClient(httpClient: HttpClient, GetOrders section: Int) {

    }
    
    func httpClient(httpClient: HttpClient, CreateOrder section: Int) {
        
    }
}

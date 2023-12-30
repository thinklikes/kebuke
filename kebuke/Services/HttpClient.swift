//
//  HttpClient.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/25.
//


import Foundation

class HttpClient {
    let delegate: HttpDelegate?
    var data: String
    var token = GlobalConfig.apiToken
    static let GetDrinks: Int = 0
    
    init(delegate: HttpDelegate) {
        self.delegate = delegate
        self.data = ""
    }
    
    init() {
        self.delegate = nil
        self.data = ""
    }
    
    func get(url: String, colsure: @escaping (String) -> Void) {
        
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                colsure(String(data: data, encoding: .utf8)!)
            }

            task.resume()
        }
    }
    
    func post(url: String, data: Data?, colsure: @escaping (String) -> Void) {
        
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "POST"
            request.httpBody = data
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                colsure(String(data: data, encoding: .utf8)!)
            }

            task.resume()
        }
    }
}

extension HttpClient {
    
    public func getOrders() {
        get(url: "https://api.airtable.com/v0/app6fNRFFBRQsU3C8/orders?sort[0][field]=drink&sort[1][field]=size&sort[2][field]=suger&sort[3][field]=temperature") { data in
            self.data = data
            self.delegate?.httpClient(httpClient: self, GetOrders: 0) ?? nil
        }
    }
    
    public func createOrder(order: Order) {
        let body = CreateOrderBody(records: [order])
        let encoded = try? JSONEncoder().encode(body)

        post(url:"https://api.airtable.com", data: encoded) { data in
            self.data = data
            self.delegate?.httpClient(httpClient: self, CreateOrder: 0) ?? nil
        }
    }
}


//
//  HttpClient.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/25.
//


import Foundation

class HttpClient {
    let delegate: HttpDelegate?
    var data: Any
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
    
    // get 方法
    private final func get(url: String, colsure: @escaping (Data?) -> Void) {
        
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                colsure(data)
            }

            task.resume()
        }
    }
    
    // post 方法
    private final func post(url: String, data: Data?, colsure: @escaping (Data?) -> Void) {
        
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = data
            
            // 印出 request body
            if let data,
               let content = String(data: data, encoding: .utf8) {
                print(url)
                print(token)
                print(content)
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                colsure(data)
            }

            task.resume()
        }
    }
}

extension HttpClient {
    
    public func getOrders() {
        get(url: "\(GlobalConfig.apiHost)/\(GlobalConfig.apiVersion)/\(GlobalConfig.clientId)/orders?pageSize=20&sort[0][field]=drink&sort[1][field]=size&sort[2][field]=sugar&sort[3][field]=temperature") { data in
            guard let decoded = try? JSONDecoder().decode(GetOrdersResponseBody.self, from: data!) else { fatalError("can not find records") }
            self.data = decoded as GetOrdersResponseBody
            self.delegate?.httpClient(httpClient: self, GetOrders: 0)
        }
    }
    
    
    /**
     建立訂單，範例如下：
      1. 將操作的 ViewController 遵從這個 protocol: HttpDelegate
      2.ViewController 裡面要實作這個方法 func httpClient(httpClient: HttpClient, CreateOrder section: Int)
       透過 httpClient.data 取得 response body
      3. 執行 post request
        let httpClient = HttpClient(delegate: self)
        let order: Order = Order(user: "巴黎人", drinkName: "草莓歐可", size: "大杯", sugar: "半糖", temperature: "去冰")
        httpClient.createOrder(order: order)
     */
    public func createOrder(order: Order) {
        let body = Record(order: order)
        let encoded = try? JSONEncoder().encode(body)

        post(url:"\(GlobalConfig.apiHost)/\(GlobalConfig.apiVersion)/\(GlobalConfig.clientId)/orders", data: encoded) { data in
            guard let decoded = try? JSONDecoder().decode(Record.self, from: data!) else { fatalError("resolved response error") }
            self.data = decoded as Record
            self.delegate?.httpClient(httpClient: self, CreateOrder: 0) ?? nil
        }
    }
}


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
    var token = "patdxtA9YR8RiI7bL.2c285057c82c2280fac92883e84e5fee586ab0b802d9ffbb0ed0787986d05e1f"
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
    
    func post() async throws {
        
    }
}

extension HttpClient {
    
    func getDrinks() {
        get(url: "https://api.airtable.com/v0/app6fNRFFBRQsU3C8/drinks") { data in
            self.data = data
            self.delegate?.httpClient(httpClient: self, GetDrinks: 0) ?? nil
        }
    }
    
}


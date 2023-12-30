//
//  AppDelegate.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 從檔案中讀取飲料的資料
        if let asset = NSDataAsset(name: "drinks") {
            let decoder = JSONDecoder()
            do {
                GlobalConfig.drinks = try decoder.decode([String: [Drink]].self, from: asset.data)
            } catch {
                print(error)
            }
        }
        
//        let httpClient = HttpClient(delegate: self)
//        var order: Order = Order(user: "巴黎人", drinkName: "草莓歐可", size: "大", sugar: "半糖", temperature: "去冰")
//        print(order)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: HttpDelegate {
    func httpClient(httpClient: HttpClient, GetOrders section: Int) {
        print(httpClient.data)
    }
    
    func httpClient(httpClient: HttpClient, CreateOrder section: Int) {
        print(httpClient.data)
    }
}

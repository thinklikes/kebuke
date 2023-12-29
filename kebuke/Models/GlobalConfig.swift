//
//  GlabolConfig.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/28.
//

import Foundation

struct GlobalConfig {
    // 全部飲品
    static var drinks: [String: [Drink]] = [String: [Drink]]()
    
    // 甜度選項
    static var sugarOptions: [String] = [
        "正常糖",
        "少糖",
        "半糖",
        "微糖",
        "二分糖",
        "一分糖",
        "無糖"
    ]
    
    // 冰塊選項
    static var temperatureOptions: [String] = [
        "全冰",
        "少冰",
        "去冰",
        "完全去冰",
        "常溫",
        "溫",
        "熱"
    ]
    
    // 容量選項
    static var sizeOptions: [String] = [
        "中",
        "大"
    ]
    
    // 飲品分類
    static var series: [String: [String]] = [
        "期間限定": [
            "期間限定"
        ],
        "經典飲品": [
            "單品茶 Classic",
            "調茶 Mix tea",
            "雲蓋 Sweet Cream Cold Foam",
            "歐蕾 Milk tea"
        ],
    ]
}

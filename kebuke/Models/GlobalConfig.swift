//
//  GlabolConfig.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/28.
//

import Foundation

struct GlobalConfig {
    /**
     飲品分類，格式如下
     [
        父分類1: [String(子分類名稱)]
     ]
     */
    static var series: [String: [String]] = [
        "季節限定": [
            "季節限定"
        ],
        "經典飲品": [
            "單品茶",
            "調茶",
            "雲蓋",
            "歐蕾"
        ],
    ]
    
    /**
     全部飲料，格式如下
     [
        "子分類1": [Drink],
        "子分類2": [Drink],
        "子分類3": [Drink],
     ]
     */
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
}

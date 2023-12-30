//
//  View.swift
//  kebuke
//
//  Created by Ines on 2023/12/30.
//

import UIKit

func drawBlock(view: UIView) {
    view.layer.cornerRadius = 8
    view.layer.shadowOffset = CGSize(width: 0,height: 6)
    view.layer.shadowRadius = 10
    view.layer.shadowOpacity = 0.1
    view.layer.shadowColor = UIColor.strong.cgColor
}

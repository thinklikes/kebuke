//
//  ClassicalCollectionViewCell.swift
//  kebuke
//
//  Created by Ines on 2023/12/30.
//

import UIKit

class ClassicalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView! {
        didSet {
            drawBlock(view: view)
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}

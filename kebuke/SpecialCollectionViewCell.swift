//
//  SpecialCollectionViewCell.swift
//  kebuke
//
//  Created by Ines on 2023/12/29.
//

import UIKit

class SpecialCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView! {
        didSet {
            drawBlock(view: view)
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.layer.backgroundColor = UIColor.white.withAlphaComponent(0.3).cgColor
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!
}

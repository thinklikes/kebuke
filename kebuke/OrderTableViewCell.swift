//
//  OrderTableViewCell.swift
//  kebuke
//
//  Created by Ines on 2023/12/31.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var orderCellView: UIView! {
        didSet {
            drawBlock(view: orderCellView)
        }
    }
    
    @IBOutlet weak var orderIconView: UIView! {
        didSet {
            orderIconView.layer.borderColor = UIColor.accent.cgColor
            orderIconView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var orderIconLabel: UILabel! {
        didSet {
            orderIconLabel.layer.borderColor = UIColor.accent.cgColor
            orderIconLabel.layer.borderWidth = 2
        }
    }
    @IBOutlet weak var orderUserLabel: UILabel!    
    @IBOutlet weak var orderDrinkLabel: UILabel!
    @IBOutlet weak var orderDescriptionLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!
    
    func randomBorder(min: Int, max: Int) -> CGFloat {
        return CGFloat((min...max).randomElement()!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderRadius = randomBorder(min: 0, max: 17)
        
        orderIconView.layer.cornerRadius = borderRadius + 2
        orderIconLabel.layer.cornerRadius = borderRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

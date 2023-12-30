//
//  HomeViewController.swift
//  kebuke
//
//  Created by Ines on 2023/12/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    var name: String!

    @IBOutlet weak var headerUIView: UIView! {
        didSet {
            drawBlock(view: headerUIView)
        }
    }
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "哈囉！\(String(name!))～作伙乎乾 :D"

    }
    


}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SpecialCollectionViewCell.self)", for: indexPath) as! SpecialCollectionViewCell
        cell.imageView.image = UIImage(named: "drink-template")
        cell.titleLabel.text = "朱玉歐蕾"
        cell.descriptionLabel.text = "木質果香調的熟成紅茶與香醇濃厚的鮮奶，揉合出細緻優雅的尾韻"
        return cell
    }
}

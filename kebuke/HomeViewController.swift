//
//  HomeViewController.swift
//  kebuke
//
//  Created by Ines on 2023/12/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user: String!

    @IBOutlet weak var headerUIView: UIView! {
        didSet {
            drawBlock(view: headerUIView)
        }
    }
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var specialCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "哈囉！\(String(user!))～作伙乎乾 :D"

    }

    @IBSegueAction func chooseDrink(_ coder: NSCoder) -> UIViewController? {
        let controller = DrinkViewController(coder: coder)
        guard let item = specialCollectionView.indexPathsForSelectedItems?.first?.item else {
            return nil
        }
        controller?.drink = GlobalConfig.drinks["季節限定"]?[item]
        return controller
    }
    

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        GlobalConfig.drinks["季節限定"]?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SpecialCollectionViewCell.self)", for: indexPath) as! SpecialCollectionViewCell
        if let drinks = GlobalConfig.drinks["季節限定"] {
            cell.imageView.image = drinks[indexPath.row].image()
            cell.titleLabel.text = drinks[indexPath.row].name
            cell.descriptionLabel.text = drinks[indexPath.row].description
        }
        return cell
    }
}

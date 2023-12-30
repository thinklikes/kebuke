//
//  HomeViewController.swift
//  kebuke
//
//  Created by Ines on 2023/12/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user: String!
    var selectClassicalIndex: Int = 0
    var selectClassicalTitle: String = "單品茶"

    @IBOutlet weak var headerUIView: UIView! {
        didSet {
            drawBlock(view: headerUIView)
        }
    }
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    @IBOutlet weak var classicalCollectionView: UICollectionView!


    @IBOutlet var classicalUIButtons: [UIButton]!

    func updateClassicalUIButton () {
        for button in classicalUIButtons {
            button.configuration?.baseBackgroundColor = UIColor.strong
        }
        classicalUIButtons[selectClassicalIndex].configuration?.baseBackgroundColor = UIColor.accent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "哈囉！\(String(user!))～作伙乎乾 :D"
        updateClassicalUIButton()
    }

    @IBAction func tapClassicalUIButtons(_ sender: UIButton) {
        selectClassicalIndex = classicalUIButtons.firstIndex(of: sender)!
        if let title = classicalUIButtons[selectClassicalIndex].titleLabel,
           let text = title.text {
            selectClassicalTitle = text
//            classicalCollectionView.reloadData()
        }
        updateClassicalUIButton()
    }
    
    
    @IBSegueAction func chooseDrink(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> DrinkViewController? {
        let controller = DrinkViewController(coder: coder)
        if (segueIdentifier == "special") {
            if let item = specialCollectionView.indexPathsForSelectedItems?.first?.item {
                controller?.drink = GlobalConfig.drinks["季節限定"]?[item]
                return controller
                
            }
        } else if (segueIdentifier == "classical") {
            if let item = classicalCollectionView.indexPathsForSelectedItems?.first?.item {
                controller?.drink = GlobalConfig.drinks[selectClassicalTitle]?[item]
                return controller
                
            }
        }
        return nil
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case specialCollectionView:
            return GlobalConfig.drinks["季節限定"]?.count ?? 1
        default:
            return GlobalConfig.drinks[selectClassicalTitle]?.count ?? 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView {
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SpecialCollectionViewCell.self)", for: indexPath) as! SpecialCollectionViewCell
            if let drinks = GlobalConfig.drinks["季節限定"] {
                cell.imageView.image = drinks[indexPath.row].image()
                cell.titleLabel.text = drinks[indexPath.row].name
                cell.descriptionLabel.text = drinks[indexPath.row].description
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClassicalCollectionViewCell.self)", for: indexPath) as! ClassicalCollectionViewCell
            if let drinks = GlobalConfig.drinks[selectClassicalTitle] {
                cell.imageView.image = drinks[indexPath.row].image()
                cell.titleLabel.text = drinks[indexPath.row].name
            }
            return cell
        }
    }
}

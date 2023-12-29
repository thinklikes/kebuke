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
            headerUIView.layer.cornerRadius = 4
            headerUIView.layer.shadowOffset = CGSize(width: 0,height: 4)
            headerUIView.layer.shadowRadius = 4
            headerUIView.layer.shadowOpacity = 0.1
            headerUIView.layer.shadowColor = UIColor.strong.cgColor
        }
    }
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "哈囉！\(String(name!))～作伙乎乾 :D"

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

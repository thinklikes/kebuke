//
//  DrinkViewController.swift
//  kebuke
//
//  Created by Ines on 2023/12/30.
//

import UIKit

class DrinkViewController: UIViewController {

    var user: String!
    var drink: Drink!
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkDescription: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    
    func updateUI() {
        drinkImage.image = drink.image()
        drinkName.text = drink.name
        drinkDescription.text = drink.description
        drinkPrice.text = "$85"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
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

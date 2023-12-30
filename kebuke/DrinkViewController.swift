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

    @IBOutlet weak var sizeOptionsScrollView: UIScrollView!
    @IBOutlet weak var sugarOptionsScrollView: UIScrollView!
    @IBOutlet weak var temperatureOptionsScrollView: UIScrollView!

    var sugerOptions = [UIButton]()
    var sizeOptions = [UIButton]()
    var temperatureOptions = [UIButton]()
    
    func makeSugarOptions() {
        for sugar: String in GlobalConfig.sugarOptions {
            var uiButton = UIButton()
            uiButton.setTitle(sugar, for: .normal)
            sugerOptions.append(uiButton)
        }
    }
    
    func makeSizeOptions() {
        for size: String in GlobalConfig.sizeOptions {
            var uiButton = UIButton()
            uiButton.setTitle(size, for: .normal)
            sizeOptions.append(uiButton)
        }
    }
    
    func makeTemperatureOptions() {
        for temperature: String in GlobalConfig.temperatureOptions {
            var uiButton = UIButton()
            uiButton.setTitle(temperature, for: .normal)
            temperatureOptions.append(uiButton)
        }
    }
    
    func updateUI() {
        drinkImage.image = drink.image()
        drinkName.text = drink.name
        drinkDescription.text = drink.description
        drinkPrice.text = "$\(drink.getPriceAmount(size: "大杯"))"
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

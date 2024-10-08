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
    var order: Order = Order()

    var percent: Double = 0
    var timer: Timer?
    
    var selectSizeIndex: Int = 0
    var selectSugarIndex: Int = 0
    var selectTemperatureIndex: Int = 0
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkDescription: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    
    @IBOutlet var sizeUIButtons: [UIButton]!
    @IBOutlet var sugarUIButtons: [UIButton]!
    @IBOutlet var temperatureUIButtons: [UIButton]!

    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!

    func updateUI() {
        drinkImage.image = drink.image()
        drinkName.text = drink.name
        drinkDescription.text = drink.description
        updatePriceUI()
    }
    func updatePriceUI() {
        drinkPrice.text = "$\(drink.getPriceAmount(size: order.size))"
    }
    func updateUIButton (UIButtons: [UIButton], index: Int) {
        for button in UIButtons {
            button.configuration?.baseBackgroundColor = UIColor.white
            button.configuration?.baseForegroundColor = UIColor.black.withAlphaComponent(0.65)
        }
        UIButtons[index].configuration?.baseBackgroundColor = UIColor.accent
        UIButtons[index].configuration?.baseForegroundColor = UIColor.white
    }
    func updateOrder() {
        updateOrderSize()
        updateOrderPrice()
        updateOrderSugar()
        updateOrderTemperature()
    }
    func updateOrderSize() {
        if let title = sizeUIButtons[selectSizeIndex].titleLabel,
           let text = title.text {
            order.size = text
        }
    }
    func updateOrderPrice() {
        if let title = sizeUIButtons[selectSizeIndex].titleLabel,
           let text = title.text {
            order.price = drink.getPriceAmount(size: text)
        }
    }
    func updateOrderSugar() {
        if let title = sugarUIButtons[selectSugarIndex].titleLabel,
           let text = title.text {
            order.sugar = text
        }
    }
    func updateOrderTemperature() {
        if let title = temperatureUIButtons[selectTemperatureIndex].titleLabel,
           let text = title.text {
            order.temperature = text
        }
    }
    func updateOrderLabel() {
        orderLabel.text = "\(order.user)．\(order.drink)．\(order.size)．\(order.sugar)．\(order.temperature)．$\(drink.getPriceAmount(size: order.size))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIButton(UIButtons: sizeUIButtons, index: selectSizeIndex)
        updateUIButton(UIButtons: sugarUIButtons, index: selectSugarIndex)
        updateUIButton(UIButtons: temperatureUIButtons, index: selectTemperatureIndex)
        
        order.user = user!
        order.drink = drink.name
        updateOrder()
        updateOrderLabel()
        
        updateUI()
    }
    
    @IBAction func tapSizeUIButtons(_ sender: UIButton) {
        selectSizeIndex = sizeUIButtons.firstIndex(of: sender)!
        updateUIButton(UIButtons: sizeUIButtons, index: selectSizeIndex)
        updateOrderSize()
        updateOrderPrice()
        updatePriceUI()
        updateOrderLabel()
    }
    
    @IBAction func tapSugarUIButtons(_ sender: UIButton) {
        selectSugarIndex = sugarUIButtons.firstIndex(of: sender)!
        updateUIButton(UIButtons: sugarUIButtons, index: selectSugarIndex)
        updateOrderSugar()
        updateOrderLabel()
    }
    
    @IBAction func tapTemperatureUIButtons(_ sender: UIButton) {
        selectTemperatureIndex = temperatureUIButtons.firstIndex(of: sender)!
        updateUIButton(UIButtons: temperatureUIButtons, index: selectTemperatureIndex)
        updateOrderTemperature()
        updateOrderLabel()
    }

    @IBAction func tapSubmitButton(_ sender: Any) {
        let httpClient = HttpClient(delegate: self)
        let order: Order = order
        httpClient.createOrder(order: order)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [self] _ in
            percent += 1.0 / 8.0
            if percent > 1 {
                percent = 0
            }
            submitButton.imageView?.image = UIImage(systemName: "rays", variableValue: percent)
        }
    }
    
}

extension DrinkViewController: HttpDelegate {
    func httpClient(httpClient: HttpClient, CreateOrder section: Int) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "成功", message: "訂單已送出", preferredStyle: .alert)
            alertController.view.tintColor = UIColor.accent
            alertController.addAction(UIAlertAction(title: "回首頁", style: .default) {_ in
                self.dismiss(animated: true)
            })
            self.present(alertController, animated: true)
            self.timer?.invalidate()
            self.timer = nil
            self.submitButton.imageView?.image = UIImage(systemName: "bag")
        }
    }
}

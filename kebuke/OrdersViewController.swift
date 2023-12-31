//
//  OrdersViewController.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/31.
//

import UIKit

class OrdersViewController: UIViewController {
    var httpClient: HttpClient!
    var orders: [Order] = []

    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var countOfOrdersLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var emptyView: UIView! {
        didSet {
            drawBlock(view: emptyView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpClient = HttpClient(delegate: self)
        // 獲取訂單
        getOrders()
        if (orders.isEmpty) {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
        }
    }

    func getOrders(offset: String = "") {
        httpClient.getOrders(offset: offset)
    }

    func updateCountOfOrdersLabel(count: Int) {
        var realValue = count

        if (realValue < 0) {
            realValue = 0
        }

        countOfOrdersLabel.text = String(realValue)
    }

    func updateTotalAmountLabel(amount: Int) {
        var realValue = amount

        if (realValue < 0) {
            realValue = 0
        }

        totalAmountLabel.text = "$" + String(realValue)
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

extension OrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(OrderTableViewCell.self)", for: indexPath) as! OrderTableViewCell

        if (orders.isEmpty) {
            return cell
        }
        let order = orders[indexPath.row]

        cell.orderIconLabel.text = String(order.user.first!).uppercased()
        cell.orderUserLabel.text = "\(order.user)"
        cell.orderDrinkLabel.text = "\(order.drink)"
        cell.orderDescriptionLabel.text = "\(order.size)．\(order.sugar)．\(order.temperature)"
        cell.orderPriceLabel.text = "$\(order.price)"
        
        return cell
    }
}

extension OrdersViewController: HttpDelegate {
    func httpClient(httpClient: HttpClient, GetOrders section: Int) {

        let data: GetOrdersResponseBody = httpClient.data as! GetOrdersResponseBody

        DispatchQueue.main.async {
            var totalAmount = 0
            for record in data.records {
                self.orders.append(record.fields)
                totalAmount += record.fields.price
            }
            self.orderTableView.reloadData()
            self.updateCountOfOrdersLabel(count: self.orders.count)
            self.updateTotalAmountLabel(amount: totalAmount)
        }
    }
}

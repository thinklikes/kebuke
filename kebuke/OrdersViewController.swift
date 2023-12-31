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
    var pageStatus: PageStatus = .NotLoadingMore

    @IBOutlet weak var orderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpClient = HttpClient(delegate: self)
        getOrders()

        // Do any additional setup after loading the view.
    }
    
    func getOrders(offset: String = "") {
        httpClient.getOrders(offset: offset)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)

        if (orders.isEmpty) {
            return cell
        }
        let order = orders[indexPath.row]

        cell.textLabel?.text = order.user
        cell.detailTextLabel?.text = "\(order.drink) \(order.size) \(order.sugar) \(order.temperature) \(order.price)"
        
        return cell
    }
}

//extension OrdersViewController: UIScrollViewDelegate {
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        guard scrollView.contentSize.height > self.tableView.frame.height, self.pageStatus == .NotLoadingMore else { return }
//        
//        if scrollView.contentSize.height - (scrollView.frame.size.height + scrollView.contentOffset.y) <= -10 {
//                        
//            self.pageStatus = .LoadingMore
//            self.tableView.reloadData {
//                // 模擬 Call API 的時間
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self.dataList += Array(repeating: "", count: 6)
//                    self.pageStatus = .NotLoadingMore
//                    self.tableView.reloadData()
//                }
//            }
//            
//        }
//
//    }
//}

extension OrdersViewController: HttpDelegate {
    func httpClient(httpClient: HttpClient, GetOrders section: Int) {

        let data: GetOrdersResponseBody = httpClient.data as! GetOrdersResponseBody
        
        DispatchQueue.main.async {
            for record in data.records {
                self.orders.append(record.fields)
            }

            self.orderTableView.reloadData()
        }
    }
}

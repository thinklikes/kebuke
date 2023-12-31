//
//  OrdersViewController.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/31.
//

import UIKit

class OrdersViewController: UIViewController {
    var httpClient: HttpClient!
    @IBOutlet weak var orderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        httpClient.getOrders()

        // Do any additional setup after loading the view.
    }
    
    func getOrders(offset: String = "") {
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        return cell
    }
    
    
}

extension OrdersViewController: HttpDelegate {
    func httpClient(httpClient: HttpClient, GetOrders section: Int) {

        let data: GetOrdersResponseBody = httpClient.data as! GetOrdersResponseBody
        DispatchQueue.main.async {
            print(data)
        }
    }
}

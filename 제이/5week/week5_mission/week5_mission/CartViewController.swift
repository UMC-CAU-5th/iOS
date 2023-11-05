//
//  CartViewController.swift
//  week5_mission
//
//  Created by 신지연 on 2023/11/02.
//

import Foundation
import UIKit


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var menu : String = "[재주문1위] 콤비네이션 피자"
    let option =  "사이즈 :"
    let size_arr = ["M", "L"]
    let price_arr = ["20000원","30000원"]
    var flag : Int = 0
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var text : String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.cartTitle.text = menu;
        cell.cartOptionName.text = option
        cell.cartPrice.text = price_arr[flag]
        cell.cartOption.text = size_arr[flag]

        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        print(flag)
        print(size_arr[flag])
        //tableView.dataSource=self
        //tableView.delegate=self
        // Do any additional setup after loading the view.
    }
    
}






//
//  ViewController.swift
//  week5_mission
//
//  Created by 신지연 on 2023/11/02.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedOnlyOne: Int? //nil사용하기 때문에 옵셔널로
    var selected: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuName: UILabel!
    /*
    @IBAction func cartAction(_ sender: UIButton) {
        performSegue(withIdentifier: "showCart", sender: sender)
    }
    */
    
    let menu_name = "[재주문1위] 콤비네이션 피자"
    let size_arr = ["M", "L"]
    let price_arr = ["20000원","30000원"]
    
    
    //행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return size_arr.count
    }
    
    //cell data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath) as! TableViewCell
        cell.sizeLabel.text = size_arr[indexPath.row]
        cell.priceLabel.text = price_arr[indexPath.row]
        cell.selectButton.tag = indexPath.row
        cell.selectButton.addTarget(self, action: #selector(sendData(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func sendData(sender: UIButton) {
        print("\(sender.tag) 버튼의 Tag로 index값을 받아서 데이터 처리")
        if selectedOnlyOne != nil{
            if !sender.isSelected{ //새로운 버튼을 누를때
                sender.isSelected = false
            }else{ //이미 선택되어 있는 버튼을 누를때
                sender.isSelected = false
                selectedOnlyOne = nil
                sender.setImage(UIImage(systemName: "circle"), for: .normal)
            }
            
        }else { //아무것도 선택하지 않았을때
            sender.isSelected = true
            selectedOnlyOne = 1
            sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            selected = sender.tag
            print(selected)
            //전달하려는 data를 text로
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CartViewController {
                    guard let vc = segue.destination as? CartViewController else { return }
                    vc.flag = selected
                    vc.menu = menu_name
                }
    }
    
    
    //cell 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuName.text = menu_name
        tableView.dataSource=self
        tableView.delegate=self
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }


}


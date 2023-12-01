//
//  ViewController.swift
//  week9misssion
//
//  Created by 신지연 on 2023/11/29.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var UIView: UILabel!
    @IBOutlet weak var TableView: UITableView!
    struct APIResponse: Codable {
        let res: [Country]
    }
    
    struct Country: Codable {
        let result : Int
        let cur_unit : String
        let cur_nm: String
        let ttb: String
        let tts: String
        let deal_bas_r : String
        let bkpr : String
        let yy_efee_r : String
        let ten_dd_efee_r : String
        let kftc_bkpr : String
        let kftc_deal_bas_r : String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
        
        callAPI{ countries in
            if let countries = countries {
                // API 호출 성공 시 데이터 사용
                //print(countries)
                cell.cur_nm.text = countries[indexPath.row].cur_nm
                cell.ttb.text = countries[indexPath.row].ttb
                cell.tts.text = countries[indexPath.row].tts
            } else {
                // API 호출 실패 시 예외 처리
                print("API 호출 실패")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // 각 행의 높이를 조정하는 코드
            return 100.0 // 적절한 값을 지정
        }

    
    
    func callAPI(completion: @escaping (Array<ViewController.Country>?) -> Void) {
        let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON"
        let param = ["authkey" : "08pqtJmdoSZPY1ddUcaxpiHgACLshTUn", "data" : "AP01"]
        AF.request(url, method: .get, parameters: param).responseJSON{
            (response) in
            switch response.result {
            case .success(let value):
                // 성공적으로 문자열로 변환된 응답을 처리
                do{
                    //throwable한 함수
                    let jsondata = try JSONSerialization.data(withJSONObject: value)
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(Array<Country>.self, from: jsondata )
                    completion(data)
                    
                } catch{
                    print("Error: \(error)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        
        //HTTP request
        

    }


}


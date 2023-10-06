//
//  ViewController.swift
//  UMC_3주차_미션3
//
//  Created by 신지연 on 2023/10/06.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

class ListClass: UITableViewCell{
    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var TitleView: UILabel!
    
    @IBOutlet weak var LocationView: UILabel!
    
    @IBOutlet weak var PriceView: UILabel!
    
}


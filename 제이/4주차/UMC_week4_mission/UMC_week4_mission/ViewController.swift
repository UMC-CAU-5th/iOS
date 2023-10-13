//
//  ViewController.swift
//  UMC_week4_mission
//
//  Created by 신지연 on 2023/10/13.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        let tableNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableNib, forCellReuseIdentifier: "TableViewCell")
        let advNib = UINib(nibName: "AdvTableViewCell", bundle: nil)
        tableView.register(advNib, forCellReuseIdentifier: "AdvTableViewCell")
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 7 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdvTableViewCell", for: indexPath) as? AdvTableViewCell
            else{
                return UITableViewCell()
            }
            return cell
        } else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7{
            return 200
        }
        else{
            return 120
        }
    }
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? AdvTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        
    }
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvCollectionViewCell", for: indexPath) as? AdvCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
                
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 120)
    }
    
}


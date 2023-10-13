//
//  AdvTableViewCell.swift
//  UMC_week4_mission
//
//  Created by 신지연 on 2023/10/13.
//

import UIKit

class AdvTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row : Int){
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        let advNib = UINib(nibName: "AdvCollectionViewCell", bundle: nil)
        collectionView.register(advNib, forCellWithReuseIdentifier: "AdvCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top:0, left:0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 3
        
        collectionView.collectionViewLayout = flowLayout
        
        
        
        //collectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  TableViewCell.swift
//  UMC_week4_mission
//
//  Created by 신지연 on 2023/10/13.
//

import UIKit

class TableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productImageView.layer.cornerRadius = 10
    
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

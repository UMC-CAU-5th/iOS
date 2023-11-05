//
//  CartTableViewCell.swift
//  week5_mission
//
//  Created by 신지연 on 2023/11/03.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartOption: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartOptionName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

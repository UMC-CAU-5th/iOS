//
//  TableViewCell.swift
//  week9misssion
//
//  Created by 신지연 on 2023/11/29.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cur_nm: UILabel!
    
    @IBOutlet weak var ttb: UILabel!
    
    @IBOutlet weak var tts: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

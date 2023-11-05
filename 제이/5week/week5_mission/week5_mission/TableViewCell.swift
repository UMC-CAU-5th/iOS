//
//  TableViewCell.swift
//  week5_mission
//
//  Created by 신지연 on 2023/11/02.
//

import UIKit

class TableViewCell: UITableViewCell {

    var selectedOnlyOne: Int? //nil사용하기 때문에 옵셔널로
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    /*
    @IBAction func selectButtonAction(_ sender: UIButton) {
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
            
        }
        
    }*/
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

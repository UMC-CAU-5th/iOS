//
//  FeedTableViewCell.swift
//  4weekM
//
//  Created by 신지연 on 2023/11/06.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    @IBOutlet weak var labelUserName: UILabel!
    
    @IBOutlet weak var imageViewFeed: UIImageView!
    
    @IBOutlet weak var buttonIsHeart: UIButton!
    
    @IBOutlet weak var buttonIsBookmark: UIButton!
    
    @IBOutlet weak var labelHowManyLike: UILabel!
    
    @IBOutlet weak var labelFeed: UILabel!
    
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected{
            buttonIsHeart.isSelected=false
        }else{
            buttonIsHeart.isSelected=true
        }
    }
    
    @IBAction func actionBookMark(_ sender: Any) {
        if buttonIsBookmark.isSelected{
            buttonIsBookmark.isSelected=false
        }else{
            buttonIsBookmark.isSelected=true
        }
    }
    
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 22.5
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        //attributedStr.addAttributes(.font, value: fontSize, range: NSRange.init(location:0, length: 3))
        
        labelFeed.attributedText = attributedStr
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

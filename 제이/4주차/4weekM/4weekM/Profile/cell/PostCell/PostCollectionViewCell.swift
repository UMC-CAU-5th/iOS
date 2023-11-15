//
//  PostCollectionViewCell.swift
//  4weekM
//
//  Created by 신지연 on 2023/11/15.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(){
        //이미지 업로드한다.
    }

}

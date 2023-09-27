//
//  CenterCollectionViewCell.swift
//  2st
//
//  Created by 정의찬 on 2023/09/27.
//

import UIKit
import SnapKit

class CenterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CenterCollectionViewCell"
    
    required init(coder : NSCoder) {
        fatalError("error")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    private lazy var titleText : UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return title
    }()
    
     lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        return image
    }()
    
    private lazy var priceText : UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return text
    }()
    
    private func makeConstraints(){
        [titleText, imageView, priceText].forEach{ self.addSubview($0) }
        
        imageView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.bottom.equalTo(titleText.snp.top).offset(10)
            make.width.lessThanOrEqualTo(100)
        }
        
        titleText.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.bottom.equalTo(priceText.snp.top).offset(10)
        }
        
        priceText.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.bottom.equalTo(priceText.snp.top).offset(10)
        }
    }
    
    
}

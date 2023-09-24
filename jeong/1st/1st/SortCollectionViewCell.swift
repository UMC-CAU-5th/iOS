//
//  SortCollectionViewCell.swift
//  1st
//
//  Created by 정의찬 on 2023/09/24.
//

import UIKit
import SnapKit

class SortCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    func setSelf(){
        self.layer.cornerRadius = layer.frame.width/2 + 1
        self.backgroundColor = UIColor.gray

        
        [imageView, nameLabel].forEach{ self.addSubview($0) }
        
        imageView.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(15)
        }
    }
    
    func configuration(name: String){
        nameLabel.text = name
    }
    
}

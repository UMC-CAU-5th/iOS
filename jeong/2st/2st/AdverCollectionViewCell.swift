//
//  AdverCollectionViewCell.swift
//  2st
//
//  Created by 정의찬 on 10/1/23.
//

import UIKit
import SnapKit

class AdverCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AdverCollectionViewCell"
    
    ///MARK: 사진
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "6.png")
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    ///MARK: 광고 제목
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    ///MARK: 광고 가격
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    

    //MARK: -init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: -function
    
    private func makeConstraints(){
        [image, titleLabel, priceLabel].forEach{ self.addSubview($0) }
        
        image.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.height.lessThanOrEqualTo(130)
        }
        
        titleLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(image.snp.bottom).offset(5)
            make.left.equalTo(image.snp.left)
            make.right.equalTo(image.snp.right)
        }
        
        priceLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(image.snp.left)
            make.right.equalTo(image.snp.right)
        }
    }
    
    func makeData(adver: AdverList){
        image.image = adver.image
        titleLabel.text = adver.title ?? ""
        priceLabel.text = adver.Price ?? ""
    }
}

//
//  CenterTableView.swift
//  2st
//
//  Created by 정의찬 on 2023/09/27.
//

import UIKit
import SnapKit

class CenterTableViewCell: UITableViewCell {
    
    static let identifier = "CenterTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder : NSCoder) {
        fatalError("error")
    }
    
    private lazy var tableImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private lazy var titleText : UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        text.numberOfLines = 0
        text.lineBreakMode = .byCharWrapping
        return text
    }()
    
    private lazy var subTitleText : UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        text.textColor = UIColor.gray
        return text
    }()
    
    private lazy var price : UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return text
    }()
    
    
    private func makeConstraints() {
        [tableImage, titleText, subTitleText, price].forEach{ self.addSubview($0) }
        
        
        tableImage.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(12)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(12)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-12)
            make.width.lessThanOrEqualTo(100)
        }
        
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(12)
            make.left.equalTo(tableImage.snp.right).offset(12)
        }
        
        subTitleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(titleText.snp.bottom).offset(12)
            make.left.equalTo(tableImage.snp.right).offset(12)
        }
        
        price.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(subTitleText.snp.bottom).offset(12)
            make.left.equalTo(tableImage.snp.right).offset(12)
        }
        
    }

}

extension CenterTableViewCell {
    public func configuration(leftImage : UIImage, titleTxt : String, subTxt : String, priceTxt : String) {
        tableImage.image = leftImage
        titleText.text = titleTxt
        subTitleText.text = subTxt
        price.text = priceTxt
    }
}

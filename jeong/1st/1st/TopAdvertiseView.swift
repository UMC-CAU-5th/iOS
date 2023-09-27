//
//  TopAdvertiseView.swift
//  1st
//
//  Created by 정의찬 on 2023/09/24.
//

import UIKit
import SnapKit

class TopAdvertiseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var titleText : UILabel = {
        let text = UILabel()
        text.text = "집콕러세요? 30% 쿠폰 드려요!!!"
        
        let attributeString = NSMutableAttributedString(string: text.text ?? "")
        let font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        attributeString.addAttributes([.font: font], range: (text.text! as NSString).range(of: "30% 쿠폰"))
        text.attributedText = attributeString
        
        return text
    }()
    
    private lazy var adverImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "voucher.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func makeCons(){
        [titleText, adverImage].forEach{ self.addSubview($0)}
        
        titleText.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.safeAreaLayoutGuide).offset(40)
        }
   
        adverImage.snp.makeConstraints{ (make) -> Void in
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
            make.left.equalTo(titleText.snp.right).offset(10)
            
        }
    
    }
    
  

}

//
//  DeliveryStackView.swift
//  1st
//
//  Created by 정의찬 on 2023/09/24.
//

import UIKit
import SnapKit

class DeliveryStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSelf()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var leftView : UIView = {
        let left = UIView()
        left.layer.cornerRadius = 10
        left.layer.borderColor = UIColor.black.cgColor
        left.layer.borderWidth = 1
        
        var titleText = UILabel()
        titleText.text = "알뜰배달"
        titleText.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        left.addSubview(titleText)
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(left.safeAreaLayoutGuide).offset(5)
            make.left.equalTo(left.safeAreaLayoutGuide).offset(5)
        }
        return left
    }()
    
    private lazy var centerView : UIView = {
        let center = UIView()
        center.layer.cornerRadius = 10
        center.layer.borderColor = UIColor.black.cgColor
        center.layer.borderWidth = 1
        
        var titleText = UILabel()
        titleText.text = "배달"
        titleText.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        center.addSubview(titleText)
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(center.safeAreaLayoutGuide).offset(5)
            make.left.equalTo(center.safeAreaLayoutGuide).offset(5)
        }
        return center
    }()
    
    
    private lazy var rightView : UIView = {
        let right = UIView()
        right.layer.cornerRadius = 10
        right.layer.borderColor = UIColor.black.cgColor
        right.layer.borderWidth = 1
        
        var titleText = UILabel()
        titleText.text = "배달"
        titleText.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        right.addSubview(titleText)
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(right.safeAreaLayoutGuide).offset(5)
            make.left.equalTo(right.safeAreaLayoutGuide).offset(5)
        }
        return right
    }()

    func setSelf(){
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .equalSpacing
        self.spacing = 8
        
        
        [leftView, centerView, rightView].forEach { view in
            self.addArrangedSubview(view)
            view.snp.makeConstraints { make in
                make.width.height.equalTo(100)
            }
        }
        
    }
    
}

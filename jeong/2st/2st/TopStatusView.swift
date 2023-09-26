//
//  TopStatusView.swift
//  2st
//
//  Created by 정의찬 on 2023/09/26.
//

import UIKit
import SnapKit

class TopStatusView: UIView {

    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        makeConstraints()
    }
    
    private lazy var townBtn : UIButton = {
        let btn = UIButton()
        
        var attString = AttributedString("조원동")
        attString.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        attString.foregroundColor = UIColor.black
        
        var btnImage = UIImage(systemName: "chevron.down")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attString
        configuration.image = btnImage
        configuration.imagePadding = 10
        configuration.imagePlacement = .trailing
        
        configuration.baseBackgroundColor = .clear
        
        btn.configuration = configuration
        
        return btn
    }()
    
    private lazy var rightOneBtn : UIButton = {
        let btn = UIButton()
        
        var btnImage = UIImage(systemName: "text.justify")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = btnImage
        configuration.imagePlacement = .all
        
        btn.configuration = configuration
        return btn
    }()
    
    private lazy var rightTwoBtn : UIButton = {
        let btn = UIButton()
        
        var btnImage = UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = btnImage
        configuration.imagePlacement = .all
        
        btn.configuration = configuration
        return btn
    }()
    
    private lazy var rightThreeBtn : UIButton = {
        let btn = UIButton()
        
        var btnImage = UIImage(systemName: "bell")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = btnImage
        configuration.imagePlacement = .all
        
        btn.configuration = configuration
        return btn
    }()
    
    private func makeConstraints(){
        [townBtn, rightOneBtn, rightTwoBtn, rightThreeBtn].forEach{ self.addSubview($0) }
        
        townBtn.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(2)
            make.width.lessThanOrEqualTo(150)
        }
        
        rightThreeBtn.snp.makeConstraints{ (make) -> Void in
            make.right.equalTo(self.safeAreaLayoutGuide).offset(-4)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(2)
        }
        
        rightTwoBtn.snp.makeConstraints{ (make) -> Void in
            make.right.equalTo(rightThreeBtn.snp.left).offset(-4)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(2)
        }
        
        rightOneBtn.snp.makeConstraints{ (make) -> Void in
            make.right.equalTo(rightTwoBtn.snp.left).offset(-4)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(2)
        }
        
        self.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(townBtn.snp.bottom).offset(15)
        }
        
    }
    
}

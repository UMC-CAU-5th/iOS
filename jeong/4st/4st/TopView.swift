//
//  TopView.swift
//  4st
//
//  Created by 정의찬 on 10/8/23.
//

import UIKit
import SnapKit



class TopView: UIView {
    
    private  lazy var title: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = UIFont(name: "NanumGothicOTF", size: 22)
        label.textColor = UIColor.white
        
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSelf()
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("error")
    }
    
    //MARK: - Funtion
    private func setSelf(){
        self.backgroundColor = UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00)
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.width.greaterThanOrEqualTo(20)
        }
        
        self.snp.makeConstraints{ (make) in
            make.bottom.equalTo(title.snp.bottom).offset(20)
        }
        
    
    }

}

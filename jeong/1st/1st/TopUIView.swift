//
//  topUIView.swift
//  1st
//
//  Created by 정의찬 on 2023/09/23.
//

import UIKit
import SnapKit

class TopUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set()
        makeCons()
    }
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
    }
    
    func set(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        self.backgroundColor = UIColor(red: 0.37, green: 0.75, blue: 0.73, alpha: 1.00)
    }
    
    private lazy var leftBtn : UIButton = {
        let btn = UIButton()
        
        var attString = AttributedString("우리집")
        attString.font = .systemFont(ofSize: 16, weight: .heavy)
        attString.foregroundColor = .white
        
        var btnImage = UIImage(systemName: "chevron.down")?.withTintColor(.systemBackground, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attString
        configuration.image = btnImage
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        
        configuration.baseBackgroundColor = .clear
        
        btn.configuration = configuration
        return btn
    }()
    
    private lazy var rectangleBtn : UIButton = {
        let btn  = UIButton()
        
        var btnImage = UIImage(systemName: "ellipsis.rectangle")?.withTintColor(.systemBackground, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = btnImage
        configuration.imagePlacement = .all
        configuration.baseBackgroundColor = .clear
        
        btn.configuration = configuration
        return btn
    }()
    
    private lazy var bellBtn : UIButton = {
        let btn = UIButton()
        
        var btnImage = UIImage(systemName: "bell")?.withTintColor(.systemBackground, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = btnImage
        configuration.imagePlacement = .all
        configuration.baseBackgroundColor = .clear
        
        btn.configuration = configuration
        
        return btn
    }()
    
    private lazy var cartBtn : UIButton = {
        let btn = UIButton()
    
        var btnImage = UIImage(systemName: "cart")?.withTintColor(.systemBackground, renderingMode: .alwaysOriginal)
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = btnImage
        configuration.imagePlacement = .all
        configuration.baseBackgroundColor = .clear
        
        btn.configuration = configuration
        
        return btn
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()

        var searchImage = UIImage(systemName: "magnifyingglass.circle")?.withTintColor(UIColor(red: 0.37, green: 0.75, blue: 0.73, alpha: 1.00), renderingMode: .alwaysOriginal)

        search.clipsToBounds = true
        search.backgroundColor = UIColor.clear
        search.backgroundImage = UIImage()
        search.layer.cornerRadius = 3
        search.layer.borderColor = UIColor.clear.cgColor
        search.layer.shadowColor = UIColor.blue.cgColor
        search.layer.shadowOpacity = 0.3
        search.layer.shadowOffset = CGSize.zero
        search.layer.shadowRadius = 3
        search.setImage(searchImage, for: .search, state: .normal)
        search.placeholder = "찾는 맛집 이름이 뭐에요?"

        if let textField = search.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
        }
    

        return search
    }()

    func makeCons(){
        
        [leftBtn, rectangleBtn, bellBtn, cartBtn, searchBar].forEach { self.addSubview($0)}
        
        leftBtn.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(5)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(5)
        }
        
        rectangleBtn.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            make.right.equalTo(leftBtn).offset(200)
        }
        
        bellBtn.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            make.right.equalTo(rectangleBtn).offset(40)
        }
        
        cartBtn.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            make.right.equalTo(bellBtn).offset(40)
        }
       
    
        searchBar.snp.makeConstraints{ (make) -> Void in
            make.height.equalTo(50)
            make.top.equalTo(leftBtn.snp.bottom).offset(15)
            make.left.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(self.safeAreaLayoutGuide).offset(-10)
        }
        
        self.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(searchBar.snp.bottom).offset(10)
        }

    }

}

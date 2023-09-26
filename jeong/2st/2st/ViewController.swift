//
//  ViewController.swift
//  2st
//
//  Created by 정의찬 on 2023/09/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraints()
    }
    
    private lazy var topView : TopStatusView = {
        let view = TopStatusView()
        return view
    }()
    
    private lazy var bottomTabBar : BottomTabBar = {
        let tab = BottomTabBar()
        
        let tabAppear = UITabBarAppearance()
        tabAppear.stackedLayoutAppearance.selected.iconColor = UIColor.orange
        tabAppear.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        tabAppear.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.orange
        tabAppear.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.orange
        
        tab.standardAppearance = tabAppear
        tab.backgroundColor = .white
        return tab
    }()

    
    private func makeConstraints(){
        [topView, bottomTabBar].forEach{ self.view.addSubview($0) }
        
        topView.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        bottomTabBar.snp.makeConstraints{ (make) -> Void in
            //make.top.equalTo(pass) ->> 상단 테이블뷰와 맞추기
            make.height.equalTo(90)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}


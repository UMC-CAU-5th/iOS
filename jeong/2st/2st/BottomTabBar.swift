//
//  BottomTabBar.swift
//  2st
//
//  Created by 정의찬 on 2023/09/26.
//

import UIKit
import SnapKit

class BottomTabBar: UITabBar {

    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTabItem()
    }
    
    private func setTabItem(){
        
        let item1 = UITabBarItem(title: "홈", image: UIImage(systemName: "house")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), tag: 0)
        let item2 = UITabBarItem(title: "동네생활", image: UIImage(systemName: "building")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), tag: 1)
        let item3 = UITabBarItem(title: "내 근처", image: UIImage(systemName: "location.circle")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), tag: 2)
        let item4 = UITabBarItem(title: "채팅", image: UIImage(systemName: "bubble.left.and.bubble.right")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), tag: 3)
        let item5 = UITabBarItem(title: "나의 당근", image: UIImage(systemName: "person")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), tag: 4)
        
        item4.badgeValue = "4"
        
        self.items = [item1, item2, item3, item4, item5]
        
    }
}

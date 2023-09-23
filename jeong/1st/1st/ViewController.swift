//
//  ViewController.swift
//  1st
//
//  Created by 정의찬 on 2023/09/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeConst()
    }
    
    //해결 완료
    private lazy var topView : TopUIView = {
        let view = TopUIView()
        return view
    }()
    
    //해결 완료
    private lazy var firstAdvertisement : TopAdvertiseView = {
        let first = TopAdvertiseView()
        first.layer.borderColor = UIColor.black.cgColor
        first.layer.borderWidth = 1
        first.layer.cornerRadius = 14
        return first
    }()

    
    private lazy var deliveryStack : DeliveryStackView = {
        let dstack = DeliveryStackView()
        return dstack
    }()
    
    
    private lazy var kindsCollection : UICollectionView = {
        let kCollection = UICollectionView()
        return kCollection
    }()
    
    private lazy var bottomCouponView : CouponBtn = {
        let btn = CouponBtn()
        return btn
    }()
    
    
    
    
    func makeConst(){
        
        [topView, firstAdvertisement,deliveryStack].forEach{ self.view.addSubview($0) }
        
        
        topView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalToSuperview()
        }
        
        firstAdvertisement.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(60)
            
        }
        
        deliveryStack.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(firstAdvertisement.snp.bottom).offset(15)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
        }
        
        
    }


}


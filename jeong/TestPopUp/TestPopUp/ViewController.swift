//
//  ViewController.swift
//  TestPopUp
//
//  Created by 정의찬 on 11/9/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var myBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Show PopUp", for: .normal)
        btn.addTarget(self, action: #selector(clikedBtn), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myBtn)
        
        myBtn.snp.makeConstraints{make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    @objc func clikedBtn(){
        showPopUp(message: "gpffh",leftActionTitle: "gkgk",rightActionTitle: "can")
    }
 
    
    


}


//
//  SuccessViewController.swift
//  4st
//
//  Created by 정의찬 on 10/8/23.
//

import UIKit
import SnapKit

class SuccessViewController: UIViewController {
    
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "성공"
        label.textAlignment = .center
        label.font = UIFont(name: "NanumGothicOTF", size: 30)
        return label
    }()
    
    private lazy var logOut: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그아웃", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeConstraints()
        
    }
    
    //MARK: - Function
    
    private func makeConstraints(){
        self.view.addSubview(loginTitle)
        self.view.addSubview(logOut)
        
        loginTitle.snp.makeConstraints{ (make) in
            make.top.equalTo(logOut.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        
        logOut.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        
        }
    }
    
    //MARK: - ButtonAction
    
    @objc func logOutAction(){
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "isAutoLogin")
        defaults.removeObject(forKey: "id")
        defaults.removeObject(forKey: "pw")
        let mainView = ViewController()
        mainView.modalPresentationStyle = .fullScreen
        mainView.modalTransitionStyle = .crossDissolve
        self.present(mainView, animated: true, completion: nil)
    }
    
}

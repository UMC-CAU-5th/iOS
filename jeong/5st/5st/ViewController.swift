//
//  ViewController.swift
//  5st
//
//  Created by 정의찬 on 11/6/23.
//

import UIKit
import SnapKit
import KakaoSDKUser
import KakaoSDKCommon
import KakaoSDKAuth

class ViewController: UIViewController {
    
    ///MARk: - 로그인 버튼
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = btn.frame.size.height / 2 + 1
        btn.addTarget(self, action: #selector(clickedBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var logoutBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("out!!", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btn.addTarget(self, action: #selector(outBtn), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraints()
    }
    
    //MARK: - Function
    
    ///MARK: = 제약 조건
    private func makeConstraints(){
        self.view.addSubview(loginBtn)
        self.view.addSubview(logoutBtn)
        
        loginBtn.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        logoutBtn.snp.makeConstraints{ make in
            make.top.equalTo(loginBtn.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    ///MARK: - 카카오톡 로그인 클릭 버튼
    @objc func clickedBtn(){
        if (UserApi.isKakaoTalkLoginAvailable()){
            UserApi.shared.loginWithKakaoTalk{ (OAuthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("성공")
                    _ = OAuthToken
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount{ (OAuthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("계정으로 로그인")
                    _ = OAuthToken
                }
            }
        }
    }
    
    @objc func outBtn(){
        UserApi.shared.logout{ error in
            if let error = error{
                print(error)
            } else{
                let alert = UIAlertController(title: "알림", message: "로그아웃됨!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}


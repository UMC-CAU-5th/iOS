//
//  ViewController.swift
//  socialLogin
//
//  Created by 신지연 on 2023/11/15.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var loginImageView: UIImageView!
    
    func loginTapAction(){
        let login = UITapGestureRecognizer(target: self, action: #selector(login))
        loginImageView.isUserInteractionEnabled = true
        loginImageView.addGestureRecognizer(login)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTapAction()
    }
    
    @objc
    func login(){
        //카카오톡 실행가능여부확인
        if (UserApi.isKakaoTalkLoginAvailable()){
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success")
                    //회원가입 성공시 oauthToken 저장가능하다
                    
                    //do something
                    print(oauthToken as Any)
                    _ = oauthToken
                    
                    //사용자 정보 성공적으로 가져오면 메인화면으로 전환
                    guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                    
                    //로그인 정보 가져오기
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("me() success.")
                            //do something
                            secondViewController.textLabel.text = user?.kakaoAccount?.profile?.nickname
                        }
                    }
                    //화면 전환 애니메이션 설정
                    secondViewController.modalTransitionStyle = .coverVertical
                    //전환된 화면이 보여지는 방법 설정(fullScreen)
                    secondViewController.modalPresentationStyle = .fullScreen
                    self.present(secondViewController, animated: true, completion: nil)
                }
            }
        }
        else{
            print("카카오톡 미설치")
        }
    }


}


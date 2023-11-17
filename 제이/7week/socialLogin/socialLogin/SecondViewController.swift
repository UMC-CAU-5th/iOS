//
//  SecondViewController.swift
//  socialLogin
//
//  Created by 신지연 on 2023/11/15.
//

import UIKit
import KakaoSDKUser

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func logoutButtonTap(_ sender: Any) {
        UserApi.shared.logout {(error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("logout() success.")
                        //로그아웃시 메인으로 이동
                        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
                        //화면 전환 애니메이션 설정
                        viewController.modalTransitionStyle = .coverVertical
                        //전환된 화면이 보여지는 방법 설정(fullScreen)
                        viewController.modalPresentationStyle = .fullScreen
                        self.present(viewController, animated: true, completion: nil)
                    }
                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

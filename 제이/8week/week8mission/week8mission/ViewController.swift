//
//  ViewController.swift
//  week8mission
//
//  Created by 신지연 on 2023/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var regiButton: UIButton!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!

    @IBAction func regiButtonTapped(_ sender: Any) {
        
        let defaults = UserDefaults.standard

        if !(idTextField.text?.isEmpty ?? true) && !(pwTextField.text?.isEmpty ?? true){

            if(idTextField.text != (UserDefaults.standard.string(forKey: "id"))){
                defaults.set(self.idTextField.text, forKey: "id")
                defaults.set(self.pwTextField.text, forKey: "pw")
                self.statusLabel.text = "회원가입완료!"
            }else{
                self.statusLabel.text = "아이디 중복!"
            }
        }else{
            self.statusLabel.text = "아이디/비번 입력!"
        }
        
    }
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        let id = UserDefaults.standard.string(forKey : "id") ?? ""
        let pw = UserDefaults.standard.string(forKey : "pw") ?? ""
        
        if (idTextField.text == id)&&(pwTextField.text == pw){
            self.statusLabel.text = "로그인성공"
        }else{
            self.statusLabel.text = "로그인실패"
        }
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        regiButton.layer.cornerRadius = 20
        

    }


}


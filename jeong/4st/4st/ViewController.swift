//
//  ViewController.swift
//  4st
//
//  Created by 정의찬 on 10/7/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //note : 폰트정보 - NanumGothicOTF,NanumGothicOTFBold
    //note : 색상 - UIColor(red: 0.13, green: 0.33, blue: 0.64, alpha: 1.00)
    
    ///MARK: - 상단 제목
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumGothicOTFBold", size: 20)
        label.text = "Member Login"
        label.textColor = UIColor(red: 0.13, green: 0.33, blue: 0.64, alpha: 1.00)
        return label
    }()
    ///MARK: - 자동로그인 버튼
    private lazy var idBtn: CheckBtn = {
        let btn = CheckBtn()
        btn.nameTite = "ID 저장하기"
        return btn
    }()
    ///MARK: - 비밀번호 보기 버튼
    private lazy var pwdBtn: CheckBtn = {
        let btn = CheckBtn()
        btn.nameTite = "비밀번호 보기"
        return btn
    }()
    ///MARK: - 아이디 입력 테스트 박스
    private lazy var idTextField: UITextField = {
        let text = UITextField()
        let placeholderText = "ID를 입력해주세요"
        let placeholderColor = UIColor.gray
        text.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        text.font = UIFont(name: "NanumGothicOTF", size: 12)
        text.textColor = UIColor.gray
        return text
    }()
    ///MARK: - 비밀번호 입력 테스트 박스
    private lazy var pwdtextField: UITextField = {
        let text = UITextField()
        let placeholderText = "비밀번호를 입력해주세요"
        let placeholderColor = UIColor.gray
        text.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        text.font = UIFont(name: "NanumGothicOTF", size: 12)
        text.textColor = UIColor.gray
        text.isSecureTextEntry = true
        return text
    }()
    ///MARK: - 체크 박스 버튼 스택
    private lazy var btnStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "NanumGothicOTF", size: 14)
        loginBtn.backgroundColor = UIColor(red: 0.13, green: 0.33, blue: 0.64, alpha: 1.00)
        return loginBtn
    }()
    ///MARK: - 구분선
    private lazy var stackLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.gray
        return line
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        // 폰트 체크 하기
        
    }
    //MARK: - Function
    private func customLabel(textValue text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "NanumGothicOTF", size: 12)
        label.textColor = UIColor.gray
        return label
    }
    
    private func makeContraints(){
        
    }
    
    
}


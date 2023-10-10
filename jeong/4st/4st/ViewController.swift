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
    //note : 색상 - UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00)
    
    private lazy var topView: TopView = {
        let view = TopView()
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "CAU_symbol.png")
        image.image = img
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    ///MARK: - 아이디 입력 테스트 박스
    private lazy var idTextField: UITextField = {
        let text = UITextField()
        let placeholderText = "ID를 입력해주세요"
        let placeholderColor = UIColor.gray
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftView = leftPaddingView
        text.leftViewMode = .always
        text.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        text.font = UIFont(name: "NanumGothicOTF", size: 14)
        text.textColor = UIColor.gray
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.borderWidth = 1
        return text
    }()
    
    ///MARK: - 비밀번호 입력 테스트 박스
    private lazy var pwdtextField: UITextField = {
        let text = UITextField()
        let placeholderText = "비밀번호를 입력해주세요"
        let placeholderColor = UIColor.gray
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftView = leftPaddingView
        text.leftViewMode = .always
        text.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        text.font = UIFont(name: "NanumGothicOTF", size: 14)
        text.textColor = UIColor.gray
        text.isSecureTextEntry = true
        return text
    }()
    
    ///MARK: - 아이디 저장 버튼
    private lazy var saveIdBtn: UIButton = {
        let btn = UIButton()
        var config = UIButton.Configuration.plain()
        let img = UIImage(systemName: "square")?.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
        config.image = img
        config.imagePlacement = .leading
        config.titlePadding = 2
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -8, bottom: 0, trailing: 0)
        config.title = "아이디 저장"
        config.baseBackgroundColor = UIColor.clear
        config.baseForegroundColor = UIColor.lightGray
        config.buttonSize = .small
        btn.configuration = config
        btn.isSelected = false
        btn.addTarget(self, action: #selector(saveIdInfor), for: .touchUpInside)
        return btn
    }()
    
    ///MARK: - 아이디 저장 버튼
    private lazy var showPwBtn: UIButton = {
        let btn = UIButton()
        var config = UIButton.Configuration.plain()
        let img = UIImage(systemName: "square")?.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
        config.image = img
        config.imagePlacement = .leading
        config.titlePadding = 2
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -8, bottom: 0, trailing: 0)
        config.title = "비밀번호 보기"
        config.baseBackgroundColor = UIColor.clear
        config.baseForegroundColor = UIColor.lightGray
        config.buttonSize = .small
        btn.configuration = config
        btn.isSelected = false
        btn.addTarget(self, action: #selector(showPwd), for: .touchUpInside)
        return btn
    }()
    
    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "NanumGothicOTFBold", size: 16)
        loginBtn.backgroundColor = UIColor(red: 0.13, green: 0.33, blue: 0.64, alpha: 1.00)
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.masksToBounds = true
        loginBtn.addTarget(self, action: #selector(unclickedBtn), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(clickedBtn), for: .touchDown)
        
        return loginBtn
    }()
    
    ///MARK: - 구분선
    private lazy var stackLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.black
        return line
    }()
    
    ///MARK: - 체크 박스 버튼 스택
    private lazy var btnStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 4
        return stack
    }()
    
    ///MARK: - 텍스트필드 스택
    private lazy var textFieldStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 1
        return stack
    }()
    
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        autoLogin()
        makeConstraints()
    }
    //MARK: - Function
    
    ///MARK: - 스택 추가
    private func addStackView(){
        self.view.addSubview(textFieldStack)
        self.view.addSubview(btnStack)
        
        [saveIdBtn, showPwBtn].forEach{ btnStack.addArrangedSubview($0) }
        
        
        [idTextField,pwdtextField].forEach{ textFieldStack.addArrangedSubview($0) }
        
        idTextField.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
        }
        
        pwdtextField.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
        }
    }
    
    ///MARK: - 제약 조건
    private func makeConstraints(){
        addStackView()
        [topView,imageView, loginBtn].forEach{ self.view.addSubview($0) }
        
        topView.snp.makeConstraints{ (make) in
            make.top.left.right.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{ (make) in
            make.top.equalTo(topView.snp.bottom).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(25)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-25)
            make.height.lessThanOrEqualTo(130)
        }
        
        textFieldStack.snp.makeConstraints{ (make) in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.height.greaterThanOrEqualTo(100)
        }
        
        btnStack.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldStack.snp.bottom).offset(20)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.width.greaterThanOrEqualTo(40)
        }
        
        loginBtn.snp.makeConstraints{ (make) in
            make.top.equalTo(btnStack.snp.bottom).offset(10)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(60)
        }
        
    }
    
    private func nextView(){
        let nextView = SuccessViewController()
        nextView.modalPresentationStyle = .fullScreen
        nextView.modalTransitionStyle = .crossDissolve
        self.present(nextView, animated: true, completion: nil)
    }
    
    private func autoLogin(){
        if let loginID = UserDefaults.standard.string(forKey: "id"),
            let loginPwd = UserDefaults.standard.string(forKey: "pw"){
            idTextField.text = loginID
            pwdtextField.text = loginPwd
        }
    }
    //MARK: - Button Action
    
    @objc func showPwd(sender: UIButton){
        if sender.isSelected == true{
            sender.isSelected = false
            sender.configuration?.image = UIImage(systemName: "square")?.withTintColor(UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00), renderingMode: .alwaysOriginal)
            pwdtextField.isSecureTextEntry = true
            
        }
        else{
            sender.isSelected = true
            sender.configuration?.image = UIImage(systemName: "checkmark.square.fill")?.withTintColor(UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00), renderingMode: .alwaysOriginal)
            pwdtextField.isSecureTextEntry = false
        }
    }
    
    @objc func saveIdInfor(sender: UIButton){
        if sender.isSelected == true{
            sender.isSelected = false
            sender.configuration?.image = UIImage(systemName: "square")?.withTintColor(UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00), renderingMode: .alwaysOriginal)
        }
        else{
            sender.isSelected = true
            sender.configuration?.image = UIImage(systemName: "checkmark.square.fill")?.withTintColor(UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00), renderingMode: .alwaysOriginal)
        }
    }
    
    @objc func checkedBtn(sender: UIButton){
        if sender.isSelected == true{
            sender.isSelected = false
            sender.configuration?.image = UIImage(systemName: "square")?.withTintColor(UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00), renderingMode: .alwaysOriginal)
            if sender == self.pwdtextField{
                pwdtextField.isSecureTextEntry = true
            }
        }
        else{
            sender.isSelected = true
            sender.configuration?.image = UIImage(systemName: "checkmark.square.fill")?.withTintColor(UIColor(red: 0.04, green: 0.33, blue: 0.65, alpha: 1.00), renderingMode: .alwaysOriginal)
        }
    }
    
    @objc func unclickedBtn(){
        loginBtn.backgroundColor = UIColor(red: 0.13, green: 0.33, blue: 0.64, alpha: 1.00)
        
        if saveIdBtn.isSelected == true{
            guard let id = self.idTextField.text else { return }
            guard let pw = self.pwdtextField.text else { return }
            
            UserDefaults.standard.set(id, forKey: "id")
            UserDefaults.standard.set(pw, forKey: "pw")
            UserDefaults.standard.set(true, forKey: "isAutoLogin")
        
        }
        nextView()
    
    }
    
    @objc func clickedBtn(){
        loginBtn.backgroundColor = UIColor.systemBlue
    }
    
    
}

//
//  ViewController.swift
//  ScissorsGame
//
//  Created by 정의찬 on 10/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    let nameData = ["1.png", "2.png", "3.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        makeConstraints()
        scissorsBtn.addTarget(self, action: #selector(didTapBtn1), for: .touchUpInside)
        paperBtn.addTarget(self, action: #selector(didTapBtn2), for: .touchUpInside)
        rockBtn.addTarget(self, action: #selector(didTapBtn3), for: .touchUpInside)
    }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var computerView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var myView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var inputStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var rockBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("주먹", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private lazy var scissorsBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("가위", for: .normal)
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private lazy var paperBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("보자기", for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private func makeConstraints(){
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        stackView.addArrangedSubview(computerView)
        stackView.addArrangedSubview(myView)
        
        view.addSubview(inputStack)
        inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        inputStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        inputStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        inputStack.addArrangedSubview(scissorsBtn)
        inputStack.addArrangedSubview(rockBtn)
        inputStack.addArrangedSubview(paperBtn)
    }
    
    @objc func didTapBtn1(){
        myView.image = UIImage(named: "1")
        let randomInput = nameData.randomElement()!
        computerView.image = UIImage(named: randomInput)
    }
    
    @objc func didTapBtn2(){
        myView.image = UIImage(named: "2")
        let randomInput = nameData.randomElement()!
        computerView.image = UIImage(named: randomInput)
    }
    
    @objc func didTapBtn3(){
        myView.image = UIImage(named: "3")
        let randomInput = nameData.randomElement()!
        computerView.image = UIImage(named: randomInput)
    }
}


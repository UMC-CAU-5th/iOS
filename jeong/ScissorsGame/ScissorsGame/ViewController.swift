//
//  ViewController.swift
//  ScissorsGame
//
//  Created by 정의찬 on 10/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    let nameData: [InputType] = [.scissors, .paper, .rock]
    
    enum InputType: String {
        case scissors
        case paper
        case rock
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        makeConstraints()
        scissorsBtn.addTarget(self, action: #selector(didTapBtn1), for: .touchUpInside)
        paperBtn.addTarget(self, action: #selector(didTapBtn2), for: .touchUpInside)
        rockBtn.addTarget(self, action: #selector(didTapBtn3), for: .touchUpInside)
    }
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과!!"
        return label
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "user"
        return label
    }()
    
    private lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "computer"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var computerView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "scissors.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var myView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "scissors.png")
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
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        stackView.addArrangedSubview(myView)
        stackView.addArrangedSubview(computerView)
        
        view.addSubview(resultLabel)
        resultLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        
        view.addSubview(userLabel)
        userLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 10).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30).isActive = true
        
        view.addSubview(computerLabel)
        computerLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 10).isActive = true
        computerLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30).isActive = true
        
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
        myView.image = UIImage(named: "scissors.png")
        let randomInput = nameData.randomElement()!
        computerView.image = UIImage(named: randomInput.rawValue)
        
        resultLabel.text = result(myInput: .scissors, computerInput: randomInput) // 게임의 승부 계산 로직
         
    }
    
    @objc func didTapBtn2(){
        myView.image = UIImage(named: "paper.png")
        let randomInput = nameData.randomElement()!
        computerView.image = UIImage(named: randomInput.rawValue)
        
        resultLabel.text = result(myInput: .paper, computerInput: randomInput) // 게임의 승부 계산 로직
    }
    
    @objc func didTapBtn3(){
        myView.image = UIImage(named: "rock.png")
        let randomInput = nameData.randomElement()!
        computerView.image = UIImage(named: randomInput.rawValue)
        
        resultLabel.text = result(myInput: .rock, computerInput: randomInput) // 게임의 승부 계산 로직
    }
    
    private func result(myInput: InputType, computerInput : InputType) -> String{
        switch myInput {
        case .scissors:
            switch computerInput {
            case .scissors:
                return "무승부"
            case .rock:
                return "패배"
            case .paper:
                return "승리"
            }
            
        case .paper:
            switch computerInput {
            case .scissors:
                return "패배"
            case .rock:
                return "승리"
            case .paper:
                return "무승부"
            }
            
        case .rock:
            switch computerInput {
            case .scissors:
                return "승리"
            case .rock:
                return "무승부"
            case .paper:
                return "패배"
            }
        
        }
    }
}


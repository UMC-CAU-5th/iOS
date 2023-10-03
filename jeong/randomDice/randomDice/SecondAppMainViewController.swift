//
//  SecondAppMainViewController.swift
//  randomDice
//
//  Created by 정의찬 on 2023/09/26.
//

import UIKit

class SecondAppMainViewController: UIViewController {

    let diceImageNameData = ["1", "2", "3", "4", "5", "6"]
    
    private lazy var doubleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "주사위 굴리기"
        return label
    }()
    
    private lazy var playStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var diceImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var secondDiceImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var changeBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("변경해주세요", for: .normal)
        btn.backgroundColor = .purple
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        view.addSubview(changeBtn)
        view.addSubview(playStackView)
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(diceImageView)
        playStackView.addArrangedSubview(secondDiceImageView)
        
        view.addSubview(doubleLabel)
        doubleLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 30).isActive = true
        doubleLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
         
        
        changeBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
        changeBtn.addTarget(self, action: #selector(didTapChangeDiceButton), for: .touchUpInside)
        
    }
    
    @objc func didTapChangeDiceButton(){
        let firstDice = diceImageNameData.randomElement() ?? "1"
        let secondDice = diceImageNameData.randomElement() ?? "1"
        
        diceImageView.image = UIImage(named: firstDice)
        secondDiceImageView.image = UIImage(named: secondDice)
        
        if firstDice == secondDice {
            doubleLabel.text = "더블"
        } else {
            doubleLabel.text = "다시 굴리기"
        }
    }
}

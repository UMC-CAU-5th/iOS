//
//  SecondAppMainViewController.swift
//  randomDice
//
//  Created by 정의찬 on 2023/09/26.
//

import UIKit

class SecondAppMainViewController: UIViewController {

    let diceImageNameData = ["1", "2", "3", "4", "5", "6"]
    
    private lazy var diceImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
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
        view.backgroundColor = .red
        view.addSubview(diceImageView)
        view.addSubview(changeBtn)
        
        diceImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        changeBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeBtn.topAnchor.constraint(equalTo: diceImageView.bottomAnchor, constant: 100).isActive = true
        
        changeBtn.addTarget(self, action: #selector(didTapChangeDiceButton), for: .touchUpInside)
        
    }
    
    @objc func didTapChangeDiceButton(){
        diceImageView.image = UIImage(named: diceImageNameData.randomElement() ?? "1")
    }
}

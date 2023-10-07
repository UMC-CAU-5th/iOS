//
//  CheckBtn.swift
//  4st
//
//  Created by 정의찬 on 10/7/23.
//

import UIKit

class CheckBtn: UIButton {
    
    var nameTite: String?
    var img: UIImage?
    
    var isChecked: Bool = false {
        didSet{
            if isChecked == true{
                self.img = UIImage(systemName: "checkmark.square.fill")?.withTintColor(UIColor(red: 0.13, green: 0.33, blue: 0.64, alpha: 1.00), renderingMode: .alwaysOriginal)
            } else {
                self.img = UIImage(systemName: "square")?.withTintColor(UIColor.gray, renderingMode: .alwaysOriginal)
            }
        }
    }
    
    //MARK: - Init
    required init?(coder aDecoder : NSCoder) {
        fatalError("error")
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        setSelf()
    }
    
    //MARK: - Funtion
    private func setSelf(){
        var config = UIButton.Configuration.plain()
        config.image = img
        config.imagePlacement = .leading
        config.imagePadding = 5
        config.title = nameTite ?? "button"
        self.configuration = config
        self.isChecked = false
    }
    
    @objc func btnClicked(sender: UIButton){
        if sender == self{
            isChecked = !isChecked
        }
    }
}

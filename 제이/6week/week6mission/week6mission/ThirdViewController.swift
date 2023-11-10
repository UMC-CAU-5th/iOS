//
//  ThirdViewController.swift
//  week6mission
//
//  Created by 신지연 on 2023/11/08.
//

import UIKit
import Hero


class ThirdViewController: UIViewController {
    
    
    
    
    
    
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        //화면 전환 애니메이션 설정
        secondViewController.modalTransitionStyle = .coverVertical
        //전환된 화면이 보여지는 방법 설정(fullScreen)
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
    self.hero.isEnabled = true
      super.viewDidLoad()
        
        
    }
    
   
    

}

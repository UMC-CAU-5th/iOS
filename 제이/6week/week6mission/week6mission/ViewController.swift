//
//  ViewController.swift
//  week6mission
//
//  Created by 신지연 on 2023/11/07.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    //@IBOutlet weak var animationView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
 
    @IBOutlet weak var lottieView: UIView!
    
    @IBAction func startButtonTap(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                // 화면 전환 애니메이션 설정
        secondViewController.modalTransitionStyle = .flipHorizontal
                // 전환된 화면이 보여지는 방법 설정 (fullScreen)
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.startButton.layer.cornerRadius = 10
        
        //lottie
        let animationView = LottieAnimationView(name: "lottieFile")
        animationView.contentMode = .scaleAspectFit
    
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        
        //애니메이션을 몇번 반복할 건지
        animationView.loopMode = .loop
        
        //애니메이션을 실행
        animationView.play()
        
    }


}


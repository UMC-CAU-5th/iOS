//
//  SecondViewController.swift
//  week6mission
//
//  Created by 신지연 on 2023/11/08.
//

import UIKit
import Lottie
import Hero

class SecondViewController: UIViewController {

    @IBOutlet weak var lottieView: UIView!
    
    private lazy var vc: TempViewController = {
      let viewController = TempViewController()
        viewController.isHeroEnabled = true
      viewController.modalPresentationStyle = .fullScreen
      return viewController
    }()
    
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        self.vc.hero.modalAnimationType = .zoom
        self.present(vc, animated: true)
    }
    
    
    @IBAction func didTapRegiButton(_ sender: Any) {
        self.vc.hero.modalAnimationType = .pageIn(direction: .left)
        self.present(vc, animated: true)
    }
    
    @IBAction func didTapGuestButton(_ sender: Any) {
        guard let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        //화면 전환 애니메이션 설정
        thirdViewController.modalTransitionStyle = .coverVertical
        //전환된 화면이 보여지는 방법 설정(fullScreen)
        thirdViewController.modalPresentationStyle = .fullScreen
        self.present(thirdViewController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LottieAnimationView(name: "lottieFile2")
        animationView.contentMode = .scaleAspectFit
    
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        
        //애니메이션을 몇번 반복할 건지
        animationView.loopMode = .loop
        
        //애니메이션을 실행
        animationView.play()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

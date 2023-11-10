//
//  TempViewController.swift
//  week6mission
//
//  Created by 신지연 on 2023/11/09.
//

import UIKit

class TempViewController: UIViewController {

    private let dismissButton: UIButton = {
      let button = UIButton()
      button.setTitle("이전으로", for: .normal)
      button.setTitleColor(.appPink, for: .normal)
      return button
    }()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = .white
      
      self.view.addSubview(self.dismissButton)
      self.dismissButton.translatesAutoresizingMaskIntoConstraints = false
      self.dismissButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      self.dismissButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
      self.dismissButton.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
    }
    
    @objc private func didTapDismissButton() {
      self.dismiss(animated: true)
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

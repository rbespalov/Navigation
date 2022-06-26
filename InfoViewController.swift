//
//  InfoViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 25.06.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Don't push it", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        
        view.addSubview(button)
        button.sizeToFit()
        button.center = view.center
        
    }
    
    @objc private func tap() {
        let ac = UIAlertController(title: "Alame", message: "Why did you push it???", preferredStyle: .alert)
        let firstButton = UIAlertAction(title: "First way", style: .default, handler: { action in print("first  way works!!!")})
        let secondButton = UIAlertAction(title: "Second way", style: .default, handler: { action in print("second  way works!!!")})
        ac.addAction(firstButton)
        ac.addAction(secondButton)
        present(ac, animated: true)
    }
    
}

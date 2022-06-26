//
//  PostViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 25.06.2022.
//

import UIKit

class PostViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.title = titlePost
        self.tabBarItem.image = UIImage(systemName: "message")
        
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap))
        
        navigationItem.rightBarButtonItem = myButton
    }
    
    var titlePost: String = "POST"
    
    @objc func tap() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}

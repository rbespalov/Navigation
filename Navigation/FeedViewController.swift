//
//  ViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.06.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show Post", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGreen
        self.navigationItem.title = "My Feed"
        
        view.addSubview(button)
        button.sizeToFit()
        button.center = view.center
        
    }
    
    @objc private func tap() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
        postVC.titlePost = newPost.title
    }
    
    var newPost = Post(title: "My Post")
}



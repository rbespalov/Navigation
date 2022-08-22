//
//  ViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.06.2022.
//
import UIKit
import StorageService


class FeedViewController: UIViewController {
    
    private lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.setTitle("Show Post", for: .normal)
        button1.layer.backgroundColor = UIColor.systemCyan.cgColor
        button1.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button1.sizeToFit()
        button1.center = view.center

        return button1
    }()

    private lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.setTitle("Again show Post", for: .normal)
        button2.layer.backgroundColor = UIColor.systemIndigo.cgColor
        button2.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button2.center = view.center
        button2.sizeToFit()

        return button2
    }()

    private lazy var stackView: UIStackView = {

        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10

        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)

        return stackView
    }()
    
    
    var newPost = Post(title: "My Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGreen
        self.navigationItem.title = "My Feed"
        self.view.addSubview(stackView)

        setupConstraint()
    }

    private func setupConstraint() {

        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            ])
        }
    
    @objc private func tap() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
}

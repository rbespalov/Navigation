//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
       let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newButton: UIButton = {
        let newButtin = UIButton(type: .system)
        newButtin.setTitle("Empty button", for: .normal)
        newButtin.translatesAutoresizingMaskIntoConstraints = false
        newButtin.backgroundColor = .systemCyan
        newButtin.setTitleColor(.white, for: .normal)
        return newButtin
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
        setupConstraints()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.view.addGestureRecognizer(gesture)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.self.frame
        
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            newButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            newButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc private func handleTap() {
        self.view.endEditing(true)
    }
    
}

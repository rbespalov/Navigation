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
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        
        
        self.view.addSubview(self.profileHeaderView)
    }
    override func viewWillLayoutSubviews() {
//        profileHeaderView.frame = view.bounds
    }
}

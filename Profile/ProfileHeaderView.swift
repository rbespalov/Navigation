//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Роман Беспалов on 28.06.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    private lazy var imageView: UIImageView = {
        let morty = UIImage(named: "morty")
        let imageView = UIImageView(image: morty!)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
//        imageView.layer.masksToBounds = true
//        imageView.layer.shouldRasterize = true

//        imageView.contentMode = UIView.ContentMode.scaleAspectFit
//        imageView.layer.cornerRadius = 100
//        imageView.clipsToBounds = true
//        imageView.layer.borderWidth = 10
//        imageView.layer.borderColor = UIColor.white.cgColor

        return imageView
        
    }()
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.backgroundColor = .systemBlue
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self .setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.addSubview(imageView)
        self.addSubview(title)
        
        self.imageView.frame = CGRect(x: 16, y: 116, width: 125, height: 125)
//        self.title.frame = CGRect(x: 300, y: 200, width: 10, height: 10)
    }
    
//    private func
}

//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Роман Беспалов on 28.06.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Subviews
    
    lazy  var newView: UIView = {
        let newView = UIView()
        newView.backgroundColor = .systemGray6
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.alpha = 0
        return newView
    }()
    
    lazy var xButton : UIImageView = {
        let xButton = UIImageView(image: UIImage(systemName: "x.circle"))
        xButton.translatesAutoresizingMaskIntoConstraints = false
        xButton.alpha = 0
        xButton.isUserInteractionEnabled = true
        let tapXbutton = UITapGestureRecognizer (
            target: self,
            action: #selector(startXanimation)
        )
        xButton.addGestureRecognizer(tapXbutton)
        return xButton
    }()
    
     lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.isUserInteractionEnabled = true
        
        let tapAvatar = UITapGestureRecognizer (
            target: self,
            action: #selector(startAnimation)
        )
        imageView.addGestureRecognizer(tapAvatar)
        return imageView
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
     lazy var status: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = UIColor.gray
        status.translatesAutoresizingMaskIntoConstraints = false
        
        return status
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton(type: .system)
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.addTarget(self, action: #selector(self.tap), for: .touchUpInside)
        statusButton.layer.cornerRadius = 14
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.translatesAutoresizingMaskIntoConstraints = false

        return statusButton
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self .setupView()
        self.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupConstraints() {
        
        let safeArea = self.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 125),
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 125),
            
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.widthAnchor.constraint(equalToConstant: 110),
            title.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27),
            title.heightAnchor.constraint(equalToConstant: 18),
            
            status.widthAnchor.constraint(equalToConstant: 100),
            status.heightAnchor.constraint(equalToConstant: 20),
            status.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -16),
            status.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            statusButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 185),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -16),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: status.leadingAnchor),
            
            newView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 405),
            newView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newView.heightAnchor.constraint(equalToConstant: 150),
            
            xButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            xButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            xButton.heightAnchor.constraint(equalToConstant: 50),
            xButton.widthAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    private func setupView() {
        self.addSubview(imageView)
        self.addSubview(title)
        self.addSubview(status)
        self.addSubview(statusButton)
        self.addSubview(textField)
        self.addSubview(newView)
        self.addSubview(xButton)
        setupConstraints()
    }
    
    @objc private func tap() {
        let text = statusText
        status.text = text
    }
    
    @objc private func statusTextChanged() {
        let input = textField.text
        statusText = input!
    }
    
    @objc private func startAnimation() {

        let VC = ProfileViewController()

        let animator = UIViewPropertyAnimator (
            duration: 0.5,
            curve: .linear
        ) {
            self.imageView.layer.frame = CGRect(x: 0, y: 0, width: VC.view.layer.frame.width, height: VC.view.layer.frame.width)
            self.imageView.center = VC.view.center
            self.imageView.layer.cornerRadius = 0
            self.newView.alpha = 0.8
        }
        animator.startAnimation()
        
        let animator2 = UIViewPropertyAnimator (
            duration: 0.3,
            curve: .linear
        ) {
            self.xButton.alpha = 1
        }
        animator2.startAnimation(afterDelay: 0.5)
    }
    
    @objc private func startXanimation() {
        let animator = UIViewPropertyAnimator (
            duration: 0.5,
            curve: .linear
        ) {
            self.newView.alpha = 0
            self.xButton.alpha = 0
            self.imageView.layer.frame = CGRect(x: 16, y: 16, width: 125, height: 125)
            self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
        }
        animator.startAnimation()
    }
}



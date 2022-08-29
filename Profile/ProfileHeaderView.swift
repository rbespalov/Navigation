//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Роман Беспалов on 28.06.2022.
//

import UIKit
import SnapKit

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
        let morty = UIImage(named: "morty")
        let imageView = UIImageView(image: morty!)
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
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.text = "Morty Smith"
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Okaaaaaaay"
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
    
    private func snapKitConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        imageView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(125)
            make.top.equalTo(safeArea).inset(16)
            make.leading.equalTo(safeArea).inset(16)
        }
        title.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.centerX.equalToSuperview()
            make.width.equalTo(110)
            make.top.equalTo(safeArea).inset(27)
        }
        status.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.bottom.equalTo(textField.snp_topMargin).inset(-16)
            make.centerX.equalToSuperview()
        }
        statusButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeArea).inset(15)
            make.height.equalTo(50)
            make.top.equalTo(safeArea).inset(200)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        textField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.bottom.equalTo(statusButton.snp_topMargin).inset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(statusButton)
        }
        newView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_bottomMargin).inset(450)
            make.leading.equalTo(safeArea)
            make.trailing.equalTo(safeArea)
            make.height.equalTo(150)
        }
        xButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeArea).inset(16)
            make.height.equalTo(50)
            make.width.equalTo(55)
            make.top.equalTo(safeArea).inset(16)
        }
    }
    
    private func setupView() {
        self.addSubview(imageView)
        self.addSubview(title)
        self.addSubview(status)
        self.addSubview(statusButton)
        self.addSubview(textField)
        self.addSubview(newView)
        self.addSubview(xButton)
        snapKitConstraints()
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



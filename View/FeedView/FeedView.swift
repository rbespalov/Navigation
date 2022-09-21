
import UIKit
import StorageService

class FeedView: UIView {

    lazy var checkTextField = UITextField()
    
    lazy var checkGuessButton = CustomButton(color: .systemGray6, title: "Check Password", titleColor: .black)

    lazy var button1 = CustomButton(color: .orange, title: "ShowPost", titleColor: .white)
    
    lazy var button2 = CustomButton(color: .cyan, title: "Show post again", titleColor: .black)
    
    lazy var checkLabel = UILabel()
    
    lazy var stackView = UIStackView()
    
    func configure() {
        
        checkTextField.translatesAutoresizingMaskIntoConstraints = false
        checkTextField.backgroundColor = .systemGray6
        checkTextField.layer.borderWidth = 1
        checkTextField.layer.borderColor = UIColor.black.cgColor
        checkTextField.layer.cornerRadius = 12
        checkTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: checkTextField.frame.height))
        checkTextField.leftViewMode = .always
        checkTextField.placeholder = "Password"
        
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        checkLabel.backgroundColor = .black
        checkLabel.layer.cornerRadius = 12
        
        checkGuessButton.layer.cornerRadius = 12
        checkGuessButton.layer.borderColor = UIColor.black.cgColor
        checkGuessButton.layer.borderWidth = 1
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        backgroundColor = UIColor.systemGreen
        
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        addSubview(stackView)
        addSubview(checkTextField)
        addSubview(checkGuessButton)
        addSubview(checkLabel)
    }
    
    func setupConstraint() {

        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            checkTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            checkTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            checkTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            checkTextField.heightAnchor.constraint(equalToConstant: 40),
            
            checkGuessButton.topAnchor.constraint(equalTo: checkTextField.bottomAnchor, constant: 10),
            checkGuessButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            checkGuessButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 40),
            
            checkLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 10),
            checkLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            checkLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            checkLabel.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            ])
        }
}
    
    
    


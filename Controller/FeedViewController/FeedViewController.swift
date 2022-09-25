
import UIKit
import StorageService


class FeedViewController: UIViewController {
    
    var output: FeedOutput?
    
    private lazy var checkTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray6
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.cornerRadius = 12
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.leftViewMode = .always
        
        return field
    }()
    
    private lazy var checkGuessButton = CustomButton(color: .systemGray6, title: "Check Password", titleColor: .black) {
        let check = FeedModel()
        
        if self.checkTextField.text != "" {
            if check.check(word: self.checkTextField.text!) {
                let ac = UIAlertController(title: "Верно!", message: "Ты все сделал правильно!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "OK", style: .default)
                ac.addAction(OKButton)
                self.present(ac, animated: true)
                self.checkLabel.backgroundColor = .green
            } else {
                let ac = UIAlertController(title: "Мимо!", message: "Не угадал!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "ЕЩе попытка", style: .default)
                ac.addAction(OKButton)
                self.present(ac, animated: true)
                self.checkLabel.backgroundColor = .red
            }
        } else {
            let ac = UIAlertController(title: "Пусто", message: "Пустое поле ввода", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "ОК", style: .default)
            ac.addAction(OKButton)
            self.present(ac, animated: true)
        }
    }
    
    private lazy var button1 = CustomButton(color: .orange, title: "ShowPost", titleColor: .white) {
        self.showPost()
    }
    
    private lazy var button2 = CustomButton(color: .cyan, title: "Show post again", titleColor: .black) {
        self.showPost()
    }
    
    private lazy var checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.layer.cornerRadius = 12
        return label
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
        self.view.addSubview(checkTextField)
        self.view.addSubview(checkGuessButton)
        self.view.addSubview(checkLabel)
        checkGuessButton.layer.cornerRadius = 12
        checkGuessButton.layer.borderColor = UIColor.black.cgColor
        checkGuessButton.layer.borderWidth = 1
        checkTextField.placeholder = "Password"

        setupConstraint()
    }

    private func setupConstraint() {

        let safeArea = view.safeAreaLayoutGuide

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
    
    @objc private func tap() {
        output?.showPost()
    }
    
    @objc private func check() {
        let check = FeedModel()
        
        if checkTextField.text != "" {
            if check.check(word: checkTextField.text!) {
                let ac = UIAlertController(title: "Верно!", message: "Ты все сделал правильно!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "OK", style: .default)
                ac.addAction(OKButton)
                present(ac, animated: true)
                checkLabel.backgroundColor = .green
            } else {
                let ac = UIAlertController(title: "Мимо!", message: "Не угадал!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "ЕЩе попытка", style: .default)
                ac.addAction(OKButton)
                present(ac, animated: true)
                checkLabel.backgroundColor = .red
            }
        } else {
            let ac = UIAlertController(title: "Пусто", message: "Пустое поле ввода", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "ОК", style: .default)
            ac.addAction(OKButton)
            present(ac, animated: true)
        }
    }
}

extension FeedViewController: FeedOutput {
    
    func showPost() {
        output?.showPost()
    }
}

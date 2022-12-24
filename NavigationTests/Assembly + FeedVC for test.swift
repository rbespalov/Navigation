
import Foundation
import UIKit

protocol FeedOutput {
    
    func showPost()
    
}

class FeedModel {
    
    let secretWord: String = "portal"
    
    func check (word: String) -> Bool {
        secretWord == word
    }
}

public struct Post {
    
    let title: String
    
    public init(title: String) {
        self.title = title
    }
}

class CustomButton: UIButton {
    
    private let buttonClosure: (() -> ())

    init (
        color: UIColor,
        title: String,
        titleColor: UIColor,
        closure: @escaping (() -> ())
    ) {
        self.buttonClosure = closure
        super.init(frame: .zero)
        backgroundColor = color
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
        self.center = center
        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc private func tap() {
           buttonClosure()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class FeedViewControllerForTest: UIViewController {
    
    var output: FeedOutput?
    
    private enum CustomError: Error {
        case emptyTextField
        case wrongPassword
    }
    
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
        self.checkPass()
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
    
    private func isPassCorrect() throws {
        let check = FeedModel()
        
        if self.checkTextField.text != "" {
            if check.check(word: self.checkTextField.text!) {
                let ac = UIAlertController(title: "Верно!", message: "Ты все сделал правильно!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "OK", style: .default)
                ac.addAction(OKButton)
                self.present(ac, animated: true)
                self.checkLabel.backgroundColor = .green
            } else {
                throw CustomError.wrongPassword
            }
        } else {
            throw CustomError.emptyTextField
        }
    }
    
    private func checkPass() {
        do {
            try isPassCorrect()
        } catch CustomError.emptyTextField {
            let ac = UIAlertController(title: "Пусто", message: "Пустое поле ввода", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "ОК", style: .default)
            ac.addAction(OKButton)
            self.present(ac, animated: true)
        } catch {
            let ac = UIAlertController(title: "Мимо!", message: "Не угадал!", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "ЕЩе попытка", style: .default)
            ac.addAction(OKButton)
            self.present(ac, animated: true)
            self.checkLabel.backgroundColor = .red
        }
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

extension FeedViewControllerForTest: FeedOutput {
    
    func showPost() {
        output?.showPost()
    }
}

class Assembly {
    
    func createFeedVC() -> FeedViewControllerForTest {
        let feedVC = FeedViewControllerForTest()
        return feedVC
    }
}

class FeedCoordinator: AppCoordinator {
    
    var transitionHandler: UINavigationController
    var output: FeedOutput?
    
    var childs: [AppCoordinator] = []
    let feedAssembly = Assembly()
    

    
    init(transitionHandler: UINavigationController) {
        self.transitionHandler = transitionHandler
    }
    
    func makeFeedVC() {
        let feedVC = feedAssembly.createFeedVC()
        feedVC.output = self
        feedVC.tabBarItem.title = "FEED"
        feedVC.tabBarItem.image = UIImage(systemName: "bolt.horizontal")
        transitionHandler.pushViewController(feedVC, animated: true)
    }
    
    func makePostVC() {
        let postVS = PostViewController()
        transitionHandler.pushViewController(postVS, animated: true)
    }

}

extension FeedCoordinator: FeedOutput {
    func showPost() {
        makePostVC()
    }
}

protocol AppCoordinator {
    
    var childs: [AppCoordinator] { get set }
    
}

class PostViewController: UIViewController {
    
    var titlePost: String = "POST"
    
    var URL = ""
    var numberOfUnresdPosts: Int = 10
    
    private enum NetworkError: LocalizedError {
        case badURL
        
        var errorDescriptiom: String? {
            switch self {
            case.badURL:
                return "Recieved invalid URL"
            }
        }
    }
    
    private lazy var newPostsButton: UIButton = {
        let button = UIButton()
        button.frame.size = .init(width: 300, height: 50)
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        button.setTitle("New unread Posts", for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(checkPostButtonTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.title = titlePost
        self.tabBarItem.image = UIImage(systemName: "message")
        self.view.addSubview(newPostsButton)
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap))
        
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func tap() {
    }
    
    private func checkUnredPosts(
        fromURL: String,
        completion: @escaping (Result<Int, NetworkError>) -> Void
    ) { guard let url = Foundation.URL(string: fromURL) else {
        completion(.failure(.badURL))
        return
    }
        print ("checking URL \(url)")
        completion(.success(10))
    }
    
    @objc private func checkPostButtonTap() {
        checkUnredPosts(fromURL: URL) { result in
            switch result {
            case.success(let count):
                let alert = UIAlertController(title: "Done", message: "You have \(count) enread postst", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
            case.failure(let error):
                let alert = UIAlertController(title: "Alert", message: "\(error.errorDescriptiom ?? "")", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
            }
        }
    }
}

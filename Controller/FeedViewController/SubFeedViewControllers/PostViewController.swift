
import UIKit
import Foundation

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
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
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

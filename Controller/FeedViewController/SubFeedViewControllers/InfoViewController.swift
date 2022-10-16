
import UIKit

class InfoViewController: UIViewController {
    
    private var infoView: InfoView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! InfoView)
    }
    
    
    override func loadView() {
            super.loadView()
            
            let infoView = InfoView()
            infoView.configure()
            infoView.setupConstraints()
            view = infoView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Info"
        setupActions()
        self.view.backgroundColor = .link
    }
    
    private func setupActions() {
        infoView.button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc private func tap() {
        let ac = UIAlertController(title: "Alame", message: "Why did you push it???", preferredStyle: .alert)
        let firstButton = UIAlertAction(title: "First way", style: .default, handler: { action in print("first  way works!!!")})
        let secondButton = UIAlertAction(title: "Second way", style: .default, handler: { action in print("second  way works!!!")})
        ac.addAction(firstButton)
        ac.addAction(secondButton)
        present(ac, animated: true)
    }
    
}

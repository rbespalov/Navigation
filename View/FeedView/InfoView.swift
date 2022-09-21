
import UIKit

class InfoView: UIView {

    lazy var button = UIButton()
    
    func configure() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Don't push it", for: .normal)
        button.sizeToFit()
        button.center = self.center
        addSubview(button)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}

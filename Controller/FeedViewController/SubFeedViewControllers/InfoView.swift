
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
        addSubview(titleLabel)
        addSubview(planetLabel)
        
        getTitle { title in
            DispatchQueue.main.async {
                self.titleLabel.text = title
            }
        }
        
        getRotationPeriod { period in
            DispatchQueue.main.async {
                self.planetLabel.text = "Orbital period for Tatuin is " + period!
            }
        }
        
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var planetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            planetLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            planetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            planetLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            planetLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}

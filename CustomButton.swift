

import UIKit

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


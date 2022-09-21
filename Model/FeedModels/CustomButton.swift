

import UIKit

class CustomButton: UIButton {

    init (
        color: UIColor,
        title: String,
        titleColor: UIColor
    ) {
        super.init(frame: .zero)
        backgroundColor = color
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
        self.center = center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


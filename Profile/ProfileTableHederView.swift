import UIKit

class ProfileTableHederView: UITableViewHeaderFooterView {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
       let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
            tuneView()
            addSubviews()
            setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(
            width: UIView.noIntrinsicMetric,
            height: 150
        )
    }
    
    
    // MARK: - Private
    
    func setup (fullName: String, statusText: String, avatar: UIImage) {
        profileHeaderView.title.text = fullName
        profileHeaderView.status.text = statusText
        profileHeaderView.imageView.image = avatar
    }
    
    private func tuneView() {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(gesture)
    }
    
    private func addSubviews() {
        self.addSubview(self.profileHeaderView)
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
        ])
        
    }
    
    @objc private func handleTap() {
        self.endEditing(true)
    }
    
}




import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.textColor = .createColor(lightMode: .black, darkMode: .white)
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.text = "Photos"
        return photosLabel
    }()
    
    private lazy var arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "arrow.right")?.withTintColor(.createColor(lightMode: .black, darkMode: .white), renderingMode: .alwaysOriginal)
        arrow.image = image
    
        return arrow
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(photosLabel)
        stackView.addArrangedSubview(arrow)
        return stackView
    }()
    
    private lazy var firstPhoto: UIImageView = {
        let firstPhoto = UIImageView()
        firstPhoto.contentMode = .scaleToFill
        firstPhoto.translatesAutoresizingMaskIntoConstraints = false
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.image = UIImage(named: "1")
        firstPhoto.clipsToBounds = true
        
        
        return firstPhoto
    }()
    
    private lazy var secondPhoto: UIImageView = {
        let firstPhoto = UIImageView()
        firstPhoto.contentMode = .scaleToFill
        firstPhoto.translatesAutoresizingMaskIntoConstraints = false
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.image = UIImage(named: "2")
        firstPhoto.clipsToBounds = true
        firstPhoto.sizeToFit()
        
        return firstPhoto
    }()
    
    private lazy var thirdPhoto: UIImageView = {
        let firstPhoto = UIImageView()
        firstPhoto.contentMode = .scaleToFill
        firstPhoto.translatesAutoresizingMaskIntoConstraints = false
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.image = UIImage(named: "3")
        firstPhoto.clipsToBounds = true
        
        return firstPhoto
    }()
    
    private lazy var fourthPhoto: UIImageView = {
        let firstPhoto = UIImageView()
        firstPhoto.contentMode = .scaleToFill
        firstPhoto.translatesAutoresizingMaskIntoConstraints = false
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.image = UIImage(named: "4")
        firstPhoto.clipsToBounds = true
        
        return firstPhoto
    }()

    
    private lazy var photoStakView: UIStackView = {
        let photoStakView = UIStackView()
        photoStakView.translatesAutoresizingMaskIntoConstraints = false
        photoStakView.axis = .horizontal
        photoStakView.distribution = .fillEqually
        photoStakView.alignment = .fill
        photoStakView.spacing = 8
        
        photoStakView.addArrangedSubview(firstPhoto)
        photoStakView.addArrangedSubview(secondPhoto)
        photoStakView.addArrangedSubview(thirdPhoto)
        photoStakView.addArrangedSubview(fourthPhoto)
        
        return photoStakView
    }()
    
    // MARK: Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Private
    
    private func setupView() {
        contentView.backgroundColor = .createColor(lightMode: .white, darkMode: .black)
    }
    
    private func setupSubViews() {
        contentView.addSubview(stackView)
        contentView.addSubview(photoStakView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photoStakView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            photoStakView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoStakView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoStakView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoStakView.heightAnchor.constraint(equalToConstant: 91.5),
        ])
    }
    
    
    
}

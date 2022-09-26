
import UIKit
import iOSIntPackage

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: Subviews
    
    lazy var photoImage: UIImageView = {
        let photoImage = UIImageView(frame: .zero)
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        
        photoImage.contentMode = .scaleToFill
        return photoImage
    }()
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupLayout()
    }
    
    // MARK: Private
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        contentView.addSubview(photoImage)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // MARK: - Public
    
    func setup1(
        with photo: UIImage
    ) {
        photoImage.image = photo
//        if let image = UIImage(named: photo.photoName) {
//            ImageProcessor().processImagesOnThread(sourceImages: <#T##[UIImage]#>, filter: .colorInvert, qos: .background) { photoImage.image = $0
//            }
//        }
    }
    
    
    
}


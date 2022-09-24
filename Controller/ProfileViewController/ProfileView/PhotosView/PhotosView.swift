

import UIKit

class PhotosView: UIView {
    
    lazy var viewLayout = UICollectionViewFlowLayout()

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    
    
    enum CollectionCellReuseID: String {
        case base = "CollectionCellReuseID_ReuseID"
    }
    
    func configure() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionCellReuseID.base.rawValue
        )
        
        backgroundColor = .systemBackground
        
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        let safeAreaGuide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
        ])
    }
}



import UIKit
import iOSIntPackage

final class PhotosViewController: UIViewController, ImageLibrarySubscriber {
    
    
    fileprivate lazy var photos: [Photo] = Photo.makePhoto()
    
    let facade = ImagePublisherFacade()
    
    var imagesFromPublisher: [UIImage] = []
    
    let photo: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "10")!]

    private var photosView: PhotosView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! PhotosView)
    }
    
    override func loadView() {
            super.loadView()
            
            let photosView = PhotosView()
            photosView.configure()
            photosView.setupConstraints()
            
            view = photosView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        
        photosView.collectionView.dataSource = self
        photosView.collectionView.delegate = self

        facade.subscribe(self)
        facade.addImagesWithTimer(time: 0.2, repeat: 20, userImages: photo)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        facade.removeSubscription(for: self)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        imagesFromPublisher.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotosView.CollectionCellReuseID.base.rawValue,
            for: indexPath) as? PhotosCollectionViewCell else {
                fatalError("could not dequeueReusableCell")
            }
        
//        let photo = photos[indexPath.row]
        cell.photoImage.image = imagesFromPublisher[indexPath.row]
//        cell.setup1(with: photo)
        
        return cell  
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(
        for width: CGFloat,
        spacing: CGFloat
    ) -> CGFloat {
        let itemsInRow: CGFloat = 3
        
        let totalSpacing: CGFloat = 2 * 8 + (itemsInRow - 1) * 8
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = itemWidth(
            for: view.frame.width,
            spacing: 8
        )
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        8
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        8
    }
}

extension PhotosViewController {
    
    func receive(images: [UIImage]) {
        
        imagesFromPublisher = images
        photosView.collectionView.reloadData()
    }
    
}

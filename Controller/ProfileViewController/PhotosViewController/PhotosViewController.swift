
import UIKit
import iOSIntPackage

final class PhotosViewController: UIViewController {
    
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
    
    
    var viewModel: PhotosViewModel! {
        didSet {
            self.viewModel.imageChanged = { [ weak self ] viewModel in
                self?.setupImages(imagesArray: viewModel.images)
            }
        }
    }
    
    fileprivate lazy var images: [UIImage] = Images.imageName
    
    private var imageArray: [UIImage] = []
    
    private func setupImages(imagesArray: [UIImage]?) {

        
        let processor = ImageProcessor()
        let startTime = Date()
        processor.processImagesOnThread(sourceImages: imagesArray!, filter: .noir, qos: .utility) { newImage in
            let finishTime = Date()
            let result = finishTime.timeIntervalSince(startTime)
            print (result)
            
//            Time Intervals
//                .background - 2.45
//                .default - 0.67
//                .userInitiated - 0.68
//                .userInteractive - 0.69
//                .utility - 0.67
            
            newImage.forEach {
                guard let image = $0 else {return }
                self.imageArray.append(UIImage(cgImage: image))
            }
            DispatchQueue.main.async {
                self.photosView.collectionView.reloadData()
            }
        }
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        viewModel.makeArray()
        photosView.collectionView.dataSource = self
        photosView.collectionView.delegate = self

//        facade.subscribe(self)
//        facade.addImagesWithTimer(time: 0.2, repeat: 20, userImages: photo)
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
//        facade.removeSubscription(for: self)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        imageArray.count
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

        let image = imageArray[indexPath.row]
        cell.setup1(with: image)
        
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

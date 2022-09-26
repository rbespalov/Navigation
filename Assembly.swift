
import Foundation
import UIKit

final class Assembly {
    
    func createFeedVC() -> FeedViewController {
        let feedVC = FeedViewController()
        return feedVC
    }
    
    func createProfileVC() -> ProfileViewController {
        let profileVC = ProfileViewController()
        return profileVC
    }
    
    func createPhotoVC() -> PhotosViewController {
        let model = Images.imageName
        let viewModel = PhotosViewModel(model: model)
        let view = PhotosViewController()
        
        view.viewModel = viewModel
        return view
    }
}

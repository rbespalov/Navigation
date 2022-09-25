

import Foundation
import UIKit

final class ProfileCoordinator: AppCoordinator {
    
    var transitionHandler: UINavigationController
    var output: ProfileOutput?
    
    var childs: [AppCoordinator] = []
    let profileAssembly = Assembly()
    

    
    init(transitionHandler: UINavigationController) {
        self.transitionHandler = transitionHandler
    }
    
    func makeProfileVC() {
        let profileVC = profileAssembly.createProfileVC()
        profileVC.output = self
        profileVC.tabBarItem.title = "PROFILE"
        profileVC.tabBarItem.image = UIImage(systemName: "person.fill")
        transitionHandler.pushViewController(profileVC, animated: true)
    }
    
    func toPhotosVC() {
        let nextViewController = PhotosViewController()
        transitionHandler.navigationBar.isHidden = false
        transitionHandler.pushViewController(
            nextViewController, animated: true
            )
    }
}

extension ProfileCoordinator: ProfileOutput {
    func showPhotos() {
        toPhotosVC()
    }
}

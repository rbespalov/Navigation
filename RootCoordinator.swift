
import Foundation
import UIKit

final class RootCoordinator: AppCoordinator {
    
    private weak var transitionHandler: UITabBarController?
    private weak var navigationController: UINavigationController?
    
    var childs: [AppCoordinator] = []
    
    // MARK: - Initialization
    
    init(
    transitionHandler: UITabBarController
    ) {
        self.transitionHandler = transitionHandler
    }
    
    // MARK: - Public
    
    func start() {
        showTabBarScreen()
    }
    
    // MARK: - Private
    
    fileprivate func showTabBarScreen() {
        
        let loginVC = LogInViewController()
        let loginNC = UINavigationController(rootViewController: loginVC)
        loginNC.tabBarItem.image = UIImage(systemName: "person.fill")
        loginNC.tabBarItem.title = "LOGIN"
//        loginVC.loginDelegate = MyLoginFactory().makeLoginInspector()
        loginVC.loginDelegate = LoginInspector()
        
        let feedTransitionHandler = UINavigationController()
        
        let feedCoordinator = FeedCoordinator(transitionHandler: feedTransitionHandler)
        feedCoordinator.makeFeedVC()
        let feedVC = feedCoordinator
        childs.append(feedCoordinator)
        
        let profileTransitionHandler = UINavigationController()
        
        let profileCoordinator = ProfileCoordinator(transitionHandler: profileTransitionHandler)
        profileCoordinator.makeProfileVC()
        let profileVC = profileCoordinator
        childs.append(profileCoordinator)
        
        transitionHandler?.tabBar.backgroundColor = .systemGray6
        transitionHandler?.setViewControllers([loginNC, feedVC.transitionHandler, profileVC.transitionHandler], animated: true)
    }
}

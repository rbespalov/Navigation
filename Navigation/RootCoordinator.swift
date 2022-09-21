
import Foundation
import UIKit

final class RootCoordinator: AppCoordinator {
    
    private weak var transitionHandler: UITabBarController?
    
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
        loginVC.loginDelegate = MyLoginFactory().makeLoginInspector()
        
        let feedTransitionHandler = UINavigationController()
        let feedCoordinator = FeedCoordinator(transitionHandler: feedTransitionHandler)
        let feedVC = feedCoordinator.makeFeedVC()
        
        
//        let feed = FeedAssembly().create(output: self)
        
        
        let profileVC = ProfileViewController()
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileNC.navigationBar.backgroundColor = .systemGray6
        profileNC.tabBarItem.title = "PROFILE"
        profileNC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        transitionHandler?.tabBar.backgroundColor = .systemGray6
        transitionHandler?.setViewControllers([loginNC, feedVC, profileNC], animated: true)
    }
    
    func showPost() {
        print ("test")
    }
}

extension RootCoordinator: FeedOutput {
    func showPostTapped() {
        showPost()
    }
}

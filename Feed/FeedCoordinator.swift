
import UIKit

final class FeedCoordinator {
    
    private weak var transitionHandler: UINavigationController?
    weak var output: FeedOutput?
    
    var childs: [AppCoordinator] = []
    let feedAssembly = FeedAssembly()
    
    init(transitionHandler: UINavigationController) {
        self.transitionHandler = transitionHandler
    }
    
    func makeFeedVC() -> UINavigationController {
        let feedVC = feedAssembly.create(output: self)
        let navigationController = UINavigationController(rootViewController: feedVC)
        navigationController.navigationBar.backgroundColor = .systemGray6
        navigationController.tabBarItem.title = "FEED"
        navigationController.tabBarItem.image = UIImage(systemName: "bolt.horizontal")
        
        
        return navigationController
    }
    func showpost() {
        print("2")
    }
}

extension FeedCoordinator: FeedOutput {
    func showPostTapped() {
//        output?.showPostTapped()
        showpost()
    }
}

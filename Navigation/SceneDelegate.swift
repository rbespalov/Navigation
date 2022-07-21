//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let feedVC = FeedViewController()
        let profileVC = ProfileViewController()
        let postVC = PostViewController()
        let loginVC = LogInViewController()
       
        let userFeed = UINavigationController(rootViewController: feedVC)
        let userProfile = UINavigationController(rootViewController: profileVC)
        let userLogin = UINavigationController(rootViewController: loginVC)
        
        userFeed.navigationBar.backgroundColor = .systemGray6
        userProfile.navigationBar.backgroundColor = .systemGray6
        
        
        let tbc = UITabBarController()
        tbc.setViewControllers([userFeed, userProfile], animated: true)
        
        userFeed.tabBarItem.title = "FEED"
        userFeed.tabBarItem.image = UIImage(systemName: "bolt.horizontal")
        
        tbc.tabBar.backgroundColor = .systemGray6
        
        userProfile.tabBarItem.title = "PROFILE"
        userProfile.tabBarItem.image = UIImage(systemName: "person.fill")

        postVC.tabBarItem.image = UIImage(systemName: "message")
        
        userLogin.tabBarItem.image = UIImage(systemName: "person.fill")
        userLogin.tabBarItem.title = "Profile"
        
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = tbc
        self.window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


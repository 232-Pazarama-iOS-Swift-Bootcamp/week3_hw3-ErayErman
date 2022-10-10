//
//  SceneDelegate.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupWindow(with: windowScene)
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

    
    private func setupWindow(with windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        let musicController = MusicMainVC()
        let movieController = MovieMainVC()
        let softwareController = SoftwareMainVC()
        let ebookController = EbookMainVC()
        let favController = favMainVC()

        
     // viewController.tabBarItem = UITabBarItem(title: "Music", image: nil, selectedImage: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        let musicNavigationController = UINavigationController(rootViewController: musicController)
        let movieNavigationController = UINavigationController(rootViewController: movieController)
        let softwareNavigationController = UINavigationController(rootViewController: softwareController)
        let ebookNavigationController = UINavigationController(rootViewController: ebookController)
        let favNavigationController = UINavigationController(rootViewController: favController)

        
        navigationController.tabBarItem.image = UIImage(systemName: "mic")
        navigationController.tabBarItem.selectedImage = UIImage(systemName: "mic.fill")
        musicNavigationController.tabBarItem.image = UIImage(systemName: "music.note")
        musicNavigationController.tabBarItem.selectedImage = UIImage(systemName: "music.note.fill")
        musicNavigationController.title = "Musics"
        movieNavigationController.tabBarItem.image = UIImage(systemName: "film")
        movieNavigationController.tabBarItem.selectedImage = UIImage(systemName: "film.fill")
        movieNavigationController.title = "Movies"
        softwareNavigationController.tabBarItem.image = UIImage(systemName: "laptopcomputer.and.iphone")
        softwareNavigationController.tabBarItem.selectedImage = UIImage(systemName: "laptopcomputer.and.iphone")
        softwareNavigationController.title = "Softwares"
        ebookNavigationController.tabBarItem.image = UIImage(systemName: "book")
        ebookNavigationController.tabBarItem.selectedImage = UIImage(systemName: "book.fill")
        ebookNavigationController.title = "Ebook"
        favNavigationController.tabBarItem.image = UIImage(systemName: "star")
        favNavigationController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        favNavigationController.title = "Favorites"

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, musicNavigationController, movieNavigationController, softwareNavigationController, ebookNavigationController]
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
    
}


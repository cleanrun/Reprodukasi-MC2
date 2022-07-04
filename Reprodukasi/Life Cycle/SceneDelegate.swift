//
//  SceneDelegate.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 17/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        setRootViewController()
//        let vc = ContentVC(nibName: "ContentVC", bundle: nil)
//        let navController = UINavigationController(rootViewController: vc)
//        window?.rootViewController = navController
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

        // Save changes in the application's managed object context when the application transitions to the background.
        AppDelegate.shared.coreDataStack.saveContext()
    }
    
    private func setRootViewController() {
        // 1. Kita cek dulu apa OnBoarding itu harus di show gak, ini pake UserDefaults
        let isFirstTimeUsingApp = UserDefaults.standard.bool(forKey: "isFirstTimeUsingApp")
        // 2. Ini placeholder buat Root View Controller yang mana yang mau kita show setelah launch nya beres
        var rootVC: UIViewController
        // 3. Kalo misalnya dia baru pertama pake appnya, kita set ke onboarding view controller
        if !isFirstTimeUsingApp {
            CoreDataRepository.current.initiateAllAchievements()
            rootVC = OnBoardVC()
            UserDefaults.standard.set(true, forKey: "isFirstTimeUsingApp")
        }
        // 4. Kalo udah pernah, dia langsung ke tab bar view controllernya
        else {
            rootVC = MainTabBarVC()
        }
        // 5. Kita set window nya ke root view controller tadi
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
}


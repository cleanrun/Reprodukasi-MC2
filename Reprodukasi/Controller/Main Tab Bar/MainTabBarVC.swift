//
//  MainTabBarVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 22/06/22.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabs()
    }

    private func setupTabs() {
        tabBar.tintColor = UIColor.PRIMARY_RED
        
        let progressVC = ProgressVC()
        let progressTabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet"))
        progressVC.tabBarItem = progressTabBarItem
        let progressTabNavController = UINavigationController(rootViewController: progressVC)
        progressTabNavController.navigationBar.tintColor = .PRIMARY_RED

        let materialsVC = MaterialsVC()
        let materialsTabBarItem = UITabBarItem(title: "Materi", image: UIImage(systemName: "book.fill"), selectedImage: UIImage(systemName: "book.fill"))
        materialsVC.tabBarItem = materialsTabBarItem
        let materialsTabNavController = UINavigationController(rootViewController: materialsVC)
        materialsTabNavController.navigationBar.tintColor = .PRIMARY_RED
        
        let challengeVC = ChallengeDetailVC()
        let challengeTabBarItem = UITabBarItem(title: "Tantangan", image: UIImage(systemName: "crown.fill"), selectedImage: UIImage(systemName: "crown.fill"))
        challengeVC.tabBarItem = challengeTabBarItem
        let challengeTabNavController = UINavigationController(rootViewController: challengeVC)
        challengeTabNavController.navigationBar.tintColor = .PRIMARY_RED
        
        let statisticsVC = StatisticsVC()
        let statisticsTabBarItem = UITabBarItem(title: "Statistik", image: UIImage(systemName: "chart.bar.doc.horizontal.fill"), selectedImage: UIImage(systemName: "chart.bar.doc.horizontal.fill"))
        statisticsVC.tabBarItem = statisticsTabBarItem
        let statisticsTabNavController = UINavigationController(rootViewController: statisticsVC)
        statisticsTabNavController.navigationBar.tintColor = .PRIMARY_RED
        
        viewControllers = [progressTabNavController, materialsTabNavController, challengeTabNavController, statisticsTabNavController]
    }
}

extension MainTabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

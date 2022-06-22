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
        let progressVC = ProgressVC()
        let progressTabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        progressVC.tabBarItem = progressTabBarItem
        
        let challengeVC = ChallengeVC()
        let challengeTabBarItem = UITabBarItem(title: "Tantangan", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        challengeVC.tabBarItem = challengeTabBarItem
        
        let statisticsVC = StatisticsVC()
        let statisticsTabBarItem = UITabBarItem(title: "Statistik", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        statisticsVC.tabBarItem = statisticsTabBarItem
        
        let materialsVC = MaterialsVC()
        let materialsTabBarItem = UITabBarItem(title: "Materi", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        materialsVC.tabBarItem = materialsTabBarItem
        
        viewControllers = [progressVC, materialsVC, challengeVC, statisticsVC]
    }
}

extension MainTabBarVC: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
}

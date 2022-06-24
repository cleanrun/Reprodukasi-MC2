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
        setNavigationTitle(0)
        
        let progressVC = ProgressVC()
        let progressTabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet"))
        progressVC.tabBarItem = progressTabBarItem
        
        let materialsVC = MaterialsVC()
        let materialsTabBarItem = UITabBarItem(title: "Materi", image: UIImage(systemName: "book.fill"), selectedImage: UIImage(systemName: "book.fill"))
        materialsVC.tabBarItem = materialsTabBarItem
        
        let challengeVC = ChallengeVC()
        let challengeTabBarItem = UITabBarItem(title: "Tantangan", image: UIImage(systemName: "crown.fill"), selectedImage: UIImage(systemName: "crown.fill"))
        challengeVC.tabBarItem = challengeTabBarItem
        
        let statisticsVC = StatisticsVC()
        let statisticsTabBarItem = UITabBarItem(title: "Statistik", image: UIImage(systemName: "chart.bar.doc.horizontal.fill"), selectedImage: UIImage(systemName: "chart.bar.doc.horizontal.fill"))
        statisticsVC.tabBarItem = statisticsTabBarItem
        
        viewControllers = [progressVC, materialsVC, challengeVC, statisticsVC]
    }
    
    private func setNavigationTitle(_ index: Int) {
        switch index {
        case 0:
            title = "Progress"
        case 1:
            title = "Materi"
        case 2:
            title = "Tantangan"
        case 3:
            title = "Statistik"
        default:
            title = ""
        }
    }
}

extension MainTabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        setNavigationTitle(tabBarController.selectedIndex)
    }
}

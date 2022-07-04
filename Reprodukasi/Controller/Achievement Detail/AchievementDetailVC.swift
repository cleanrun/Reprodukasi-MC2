//
//  AchievementDetailVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 01/07/22.
//

import UIKit

class AchievementDetailVC: UIViewController {
    
    // MARK: - IBOutlets and UI Components
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeAchievedLabel: UILabel!
    
    // MARK: - Variables
    private var achievement: AchievementModel!
    
    // MARK: - Overriden Functions
    init(achievement: AchievementModel) {
        super.init(nibName: nil, bundle: nil)
        self.achievement = achievement
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        
        timeAchievedLabel.isHidden = true
        
        titleLabel.text = achievement.title
        if achievement.dateAchieved != nil {
            achievementImage.image = UIImage(named: achievement.achievedImage)
            descriptionLabel.text = "Telah dicapai dengan \(achievement.desc)"
        } else {
            achievementImage.image = UIImage(named: achievement.siluetteImage)
            descriptionLabel.text = "Dicapai dengan \(achievement.desc)"
        }
    }
    
    // MARK: - Custom Functions
    
    // MARK: - Actions

}

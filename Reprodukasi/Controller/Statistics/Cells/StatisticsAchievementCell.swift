//
//  StatisticsAchievementCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 25/06/22.
//

import UIKit

class StatisticsAchievementCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    static let DEFAULT_HEIGHT: CGFloat = 217

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        containerView.applyCardView()
    }
    
    func setContents(allAchievements: [AchievementModel], achievedAchievements: [AchievementModel]) {
        progressLabel.text = "\(achievedAchievements.count) dari \(allAchievements.count) tercapai"
        progressView.progress = Float(achievedAchievements.count / allAchievements.count)
    }
    
}

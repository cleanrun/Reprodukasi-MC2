//
//  StatisticsLearningProgressCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 25/06/22.
//

import UIKit

class StatisticsLearningProgressCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var learningProgressDescriptionLabel: UILabel!
    @IBOutlet weak var learningProgressView: UIProgressView!
    
    static let DEFAULT_HEIGHT: CGFloat = 160
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        containerView.applyCardView()
    }
    
    func setupContents() {
        // FIXME: Implement this soon
    }
    
}

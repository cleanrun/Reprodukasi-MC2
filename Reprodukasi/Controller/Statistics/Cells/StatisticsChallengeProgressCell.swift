//
//  StatisticsChallengeProgressCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 25/06/22.
//

import UIKit

class StatisticsChallengeProgressCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    static let DEFAULT_HEIGHT: CGFloat = 140

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

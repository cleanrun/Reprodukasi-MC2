//
//  ChallengeHistoryCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 28/06/22.
//

import UIKit

class ChallengeHistoryCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var challengeStatusImage: UIImageView!
    @IBOutlet weak var challengeTitleLabel: UILabel!
    @IBOutlet weak var challengeDescriptionLabel: UILabel!
    
    static let DEFAULT_HEIGHT: CGFloat = 120

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        containerView.applyCardView()
    }
    
}

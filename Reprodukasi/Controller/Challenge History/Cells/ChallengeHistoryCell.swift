//
//  ChallengeHistoryCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 28/06/22.
//

import UIKit

class ChallengeHistoryCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var challengeStatusImage: UIImageView!
    @IBOutlet weak var challengeTitleLabel: UILabel!
    @IBOutlet weak var challengeDescriptionLabel: UILabel!
    
    static let DEFAULT_HEIGHT: CGFloat = 140

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        containerView.applyCardView()
    }
    
    func setContents(_ model: ChallengeModel) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateLabel.text = dateFormatter.string(from: model.dateTime)
        
        challengeStatusImage.image = UIImage(systemName: model.isFinished ? "checkmark.circle.fill" : "xmark.circle.fill")?.withTintColor(model.isFinished ? UIColor.SUCCESS_GREEN! : UIColor.PRIMARY_RED!, renderingMode: .alwaysOriginal)
        challengeTitleLabel.text = model.title
        challengeDescriptionLabel.text = model.desc
    }
    
}

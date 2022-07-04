//
//  TodaysChallengeCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 23/06/22.
//

import UIKit

class TodaysChallengeCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let DEFAULT_HEIGHT: CGFloat = 215

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.applyCardView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupContents(_ model: ChallengeModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.desc
        
        if model.isFinished {
            statusImage.image = UIImage(systemName: "checkmark.shield.fill")?.withTintColor(UIColor.SUCCESS_GREEN!, renderingMode: .alwaysOriginal)
            statusLabel.text = "Telah Selesai"
            statusLabel.textColor = UIColor.SUCCESS_GREEN
        } else {
            statusImage.image = UIImage(systemName: "hourglass.circle.fill")?.withTintColor(UIColor(hex: "#999999"), renderingMode: .alwaysOriginal)
            statusLabel.text = "Belum Selesai"
            statusLabel.textColor = UIColor(hex: "#999999")
        }
    }
    
}

//
//  ContinueLearningCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 23/06/22.
//

import UIKit

class ContinueLearningCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var leadingImageContainerView: UIView!
    @IBOutlet weak var leadingImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    static let DEFAULT_HEIGHT: CGFloat = 160
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leadingImageContainerView.roundEachCorners(corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 10)
        containerView.applyCardView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupContents() {
        // FIXME: Implement this soon
    }
    
}

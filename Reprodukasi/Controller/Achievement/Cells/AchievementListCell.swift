//
//  AchievementListCell.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 01/07/22.
//

import UIKit

class AchievementListCell: UICollectionViewCell {

    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var achievementLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContents(_ model: AchievementModel) {
        achievementImage.image = model.dateAchieved != nil ? UIImage(named: model.achievedImage) : UIImage(named: model.siluetteImage)
        achievementLabel.text = model.title
    }

}

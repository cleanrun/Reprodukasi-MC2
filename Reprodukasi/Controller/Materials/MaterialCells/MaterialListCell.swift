//
//  MaterialListCell.swift
//  Reprodukasi
//
//  Created by Rinaldi Alfian on 23/06/22.
//

import UIKit

class MaterialListCell: UITableViewCell {
    
    
    @IBOutlet weak var containerUI: UIView!
    
    @IBOutlet weak var imageContainView: UIView!
    @IBOutlet weak var imageMateriUI: UIImageView!
    
    @IBOutlet weak var materiNameUI: UILabel!
    @IBOutlet weak var materiPreviewUI: UILabel!
    
    @IBOutlet weak var progressLabelUI: UILabel!
    @IBOutlet weak var progressViewUI: UIProgressView!
    
    
    var materialModel:MaterialModel!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        imageMateriUI.image = UIImage(named: materialModel.image)
        materiNameUI.text = materialModel.title
        materiPreviewUI.text = materialModel.detail
        progressLabelUI.text = materialModel.percent
        imageMateriUI.layer.cornerRadius = 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageContainView.roundEachCorners(corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 10)
        containerUI.applyCardView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

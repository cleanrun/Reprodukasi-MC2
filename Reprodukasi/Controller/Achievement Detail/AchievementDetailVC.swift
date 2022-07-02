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
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Overriden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Custom Functions
    
    // MARK: - Actions

}

//
//  AchievementVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 29/06/22.
//

import UIKit

class AchievementVC: UIViewController {
    
    // MARK: - IBOutlets and UI Components
    @IBOutlet weak var achievementProgressLabel: UILabel!
    @IBOutlet weak var achievementProgressView: UIProgressView!
    @IBOutlet weak var achievementCollectionView: UICollectionView!
    
    // MARK: - Variables
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "AchievementVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        title = "Pencapaian"
        
        achievementCollectionView.delegate = self
        achievementCollectionView.dataSource = self
    }
    
    // MARK: - Custom Functions
    
    // MARK: - Actions

}

// MARK: - Collection view delegate and data source
extension AchievementVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}

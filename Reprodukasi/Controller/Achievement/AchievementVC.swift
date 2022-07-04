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
    private var allAchievements: [AchievementModel] = []
    private var achievedAchievements: [AchievementModel] = []
    private var notAchievedAchievements: [AchievementModel] = []
    
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
        
        do {
            allAchievements = try CoreDataRepository.current.fetchAchievements(type: .all)
            achievedAchievements = try CoreDataRepository.current.fetchAchievements(type: .achieved)
            notAchievedAchievements = try CoreDataRepository.current.fetchAchievements(type: .notAchieved)
        } catch {
            print(error.localizedDescription)
        }
        
        achievementProgressLabel.text = "\(achievedAchievements.count) dari \(allAchievements.count) tercapai"
        achievementProgressView.progress = Float(achievedAchievements.count / allAchievements.count)
        
        achievementCollectionView.delegate = self
        achievementCollectionView.dataSource = self
        achievementCollectionView.register(UINib(nibName: "AchievementListCell", bundle: nil), forCellWithReuseIdentifier: "AchievementListCell")
        achievementCollectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.REUSE_IDENTIFIER)
    }
    
    // MARK: - Custom Functions
    private func routeToAchievementDetail(achievement: AchievementModel) {
        let vc = AchievementDetailVC(achievement: achievement)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions

}

// MARK: - Collection view delegate and data source
extension AchievementVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? achievedAchievements.count : notAchievedAchievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementListCell", for: indexPath) as! AchievementListCell
        indexPath.section == 0 ? cell.setContents(achievedAchievements[indexPath.row]) : cell.setContents(notAchievedAchievements[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 3
        return CGSize(width: size, height: size - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.REUSE_IDENTIFIER, for: indexPath) as! CollectionHeaderView
            if indexPath.section == 0 {
                headerView.setTitle("Tercapai")
            } else {
                headerView.setTitle("Belum Tercapai")
            }
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let achievement = indexPath.section == 0 ? achievedAchievements[indexPath.row] : notAchievedAchievements[indexPath.row]
        routeToAchievementDetail(achievement: achievement)
    }
}

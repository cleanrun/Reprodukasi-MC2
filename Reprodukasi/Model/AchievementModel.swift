//
//  Challenge.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation
import CoreData

struct AchievementModel {
    var achievementId: Int16
    var title: String
    var desc: String
    var achievedImage: String
    var siluetteImage: String
    var dateAchieved: Date?
}

extension AchievementModel {
    func asCoreDataModel(with context: NSManagedObjectContext) -> Achievement {
        let achievement = Achievement(context: context)
        achievement.setValue(achievementId, forKey: #keyPath(Achievement.achievementId))
        achievement.setValue(title, forKey: #keyPath(Achievement.title))
        achievement.setValue(desc, forKey: #keyPath(Achievement.desc))
        achievement.setValue(achievedImage, forKey: #keyPath(Achievement.achievedImage))
        achievement.setValue(siluetteImage, forKey: #keyPath(Achievement.siluetteImage))
        achievement.setValue(dateAchieved, forKey: #keyPath(Achievement.dateAchieved))
        return achievement
    }
    
    static func getAllChallenges() -> [AchievementModel] {
        [
            AchievementModel(achievementId: 1, title: "Akhirnya Aku Belajar", desc: "Menyelesaikan materi pertamamu", achievedImage: AssetName.ACHIEVEMENT_ACHIEVED_1, siluetteImage: AssetName.ACHIEVEMENT_SILUETTE_1),
            AchievementModel(achievementId: 2, title: "Sangat Menantang", desc: "Menyelesaikan tantangan pertamamu", achievedImage: AssetName.ACHIEVEMENT_ACHIEVED_2, siluetteImage: AssetName.ACHIEVEMENT_SILUETTE_2),
            AchievementModel(achievementId: 3, title: "4 Sehat 5 Sempurna", desc: "Menyelesaikan 10 tantangan yang berhubungan dengan makanan", achievedImage: AssetName.ACHIEVEMENT_ACHIEVED_3, siluetteImage: AssetName.ACHIEVEMENT_SILUETTE_3),
            AchievementModel(achievementId: 4, title: "Akhirnya Menjaga Kesehatan", desc: "Menyelesaikan 10 tantangan yang berhubungan dengan olahraga", achievedImage: AssetName.ACHIEVEMENT_ACHIEVED_4, siluetteImage: AssetName.ACHIEVEMENT_SILUETTE_4),
            AchievementModel(achievementId: 5, title: "Bagaikan mimpi berangan, apa itu tantangan?", desc: "Menyelesaikan total 25 tantangan", achievedImage: AssetName.ACHIEVEMENT_ACHIEVED_5, siluetteImage: AssetName.ACHIEVEMENT_SILUETTE_5),
        ]
    }
}

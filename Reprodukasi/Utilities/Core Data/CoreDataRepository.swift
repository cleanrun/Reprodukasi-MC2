//
//  CoreDataRepository.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation
import CoreData

class CoreDataRepository {
    static let current = CoreDataRepository()
    
    private let managedContext = AppDelegate.shared.coreDataStack.managedContext
    
    func initiateAllAchievements() {
        let achievements = AchievementModel.getAllChallenges()
        for achievement in achievements {
            let _ = achievement.asCoreDataModel(with: managedContext)
            AppDelegate.shared.coreDataStack.saveContext()
        }
    }
    
    func fetchAchievements(type: AchievemetType) throws -> [AchievementModel] {
        let fetchRequest: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        var resultArray: [AchievementModel] = []
        let managedContext = AppDelegate.shared.coreDataStack.managedContext
        let results = try managedContext.fetch(fetchRequest)
        for result in results {
            let resultModel = result.asStruct
            if type == .all {
                resultArray.append(resultModel)
            } else if type == .achieved {
                if resultModel.dateAchieved != nil {
                    resultArray.append(resultModel)
                } else {
                    continue
                }
            } else if type == .notAchieved {
                if resultModel.dateAchieved == nil {
                    resultArray.append(resultModel)
                } else {
                    continue
                }
            }
        }
        return resultArray
    }
}

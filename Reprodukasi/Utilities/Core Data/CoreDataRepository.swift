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
        let achievements = AchievementModel.getAllAchievements()
        for achievement in achievements {
            let _ = achievement.asCoreDataModel(with: managedContext)
            AppDelegate.shared.coreDataStack.saveContext()
        }
    }
    
    func fetchAchievements(type: AchievemetType) throws -> [AchievementModel] {
        let fetchRequest: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        var resultArray: [AchievementModel] = []
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
    
    private func setTodaysChallenge() {
        let challengeList = ChallengeList.getRandomChallengeList()
        let _ = ChallengeModel(from: challengeList).asCoreDataModel(with: managedContext)
        AppDelegate.shared.coreDataStack.saveContext()
    }
    
    func initiateTodaysChallenge() {
        let currentDate = Date().onlyDate
        let predicate = NSPredicate(format: "dateTime = %@", currentDate! as NSDate)
        let fetchRequest: NSFetchRequest<Challenge> = Challenge.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if results.isEmpty {
                setTodaysChallenge()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getTodaysChallenge() -> ChallengeModel? {
        let currentDate = Date().onlyDate
        let predicate = NSPredicate(format: "dateTime = %@", currentDate! as NSDate)
        let fetchRequest: NSFetchRequest<Challenge> = Challenge.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            let challengeModel = results.first?.asStruct
            return challengeModel
        } catch {
            return nil
        }
    }
    
    func finishTodaysChallenge(completion: @escaping (() -> Void) = {}) {
        let currentDate = Date().onlyDate
        let predicate = NSPredicate(format: "dateTime = %@", currentDate! as NSDate)
        let fetchRequest: NSFetchRequest<Challenge> = Challenge.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            let challengeModel = results.first
            challengeModel?.setValue(true, forKey: #keyPath(Challenge.isFinished))
            AppDelegate.shared.coreDataStack.saveContext()
            completion()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getChallengeHistory() -> [ChallengeModel] {
        let fetchRequest: NSFetchRequest<Challenge> = Challenge.fetchRequest()
        var resultArray: [ChallengeModel] = []
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for result in results {
                resultArray.append(result.asStruct)
            }
            return resultArray
        } catch {
            return []
        }
    }
    
}

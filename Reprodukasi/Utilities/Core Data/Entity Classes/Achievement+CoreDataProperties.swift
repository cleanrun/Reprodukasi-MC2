//
//  Challenge+CoreDataProperties.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//
//

import Foundation
import CoreData


extension Achievement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }

    @NSManaged public var achievementId: Int16
    @NSManaged public var title: String
    @NSManaged public var desc: String
    @NSManaged public var achievedImage: String
    @NSManaged public var siluetteImage: String
    @NSManaged public var dateAchieved: Date?
    
    var asStruct: AchievementModel {
        get {
            return AchievementModel(achievementId: self.achievementId, title: self.title, desc: self.desc, achievedImage: self.achievedImage, siluetteImage: self.siluetteImage, dateAchieved: self.dateAchieved)
        } set {
            self.achievementId = newValue.achievementId
            self.title = newValue.title
            self.desc = newValue.title
            self.achievedImage = newValue.achievedImage
            self.siluetteImage = newValue.siluetteImage
            self.dateAchieved = newValue.dateAchieved
        }
    }

}

extension Achievement : Identifiable {

}

//
//  Challenge+CoreDataProperties.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//
//

import Foundation
import CoreData


extension Challenge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Challenge> {
        return NSFetchRequest<Challenge>(entityName: "Challenge")
    }

    @NSManaged public var title: String
    @NSManaged public var desc: String
    @NSManaged public var category: ChallengeCategory
    @NSManaged public var isFinished: Bool
    @NSManaged public var dateTime: Date

    var asStruct: ChallengeModel {
        get {
            return ChallengeModel(title: self.title, desc: self.desc, category: self.category, isFinished: self.isFinished, dateTime: self.dateTime)
        } set {
            self.isFinished = newValue.isFinished
        }
    }
}

extension Challenge : Identifiable {

}

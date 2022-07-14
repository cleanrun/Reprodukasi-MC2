//
//  ChallengeModel.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation
import CoreData

struct ChallengeModel {
    var title: String
    var desc: String
    var category: ChallengeCategory
    var isFinished: Bool
    var dateTime: Date
    
    init(title: String, desc: String, category: ChallengeCategory, isFinished: Bool, dateTime: Date) {
        self.title = title
        self.desc = desc
        self.category = category
        self.isFinished = isFinished
        self.dateTime = dateTime
    }
    
    init(from challengeList: ChallengeList) {
        self.title = challengeList.title
        self.desc = challengeList.desc
        self.category = challengeList.category
        self.isFinished = false
        self.dateTime = Date().onlyDate!
    }
}

extension ChallengeModel {
    func asCoreDataModel(with context: NSManagedObjectContext) -> Challenge {
        let challenge = Challenge(context: context)
        challenge.setValue(title, forKey: #keyPath(Challenge.title))
        challenge.setValue(desc, forKey: #keyPath(Challenge.desc))
        challenge.setValue(category.rawValue, forKey: #keyPath(Challenge.category))
        challenge.setValue(isFinished, forKey: #keyPath(Challenge.isFinished))
        challenge.setValue(dateTime, forKey: #keyPath(Challenge.dateTime))
        return challenge
    }
}

struct ChallengeList {
    var title: String
    var desc: String
    var category: ChallengeCategory
}

extension ChallengeList {
    static func getAllChallengeList() -> [ChallengeList] {
        [
            ChallengeList(title: "Ayo makan Omega-3 hari ini!", desc: "Susu Kedelai, Kacang Tanah, Ikan (Sarden)", category: .food),
            ChallengeList(title: "Mencoba pose bridge 10 kali!", desc: "Laksanakan pose “Jembatan” biar semakin ngetop!", category: .sport),
            ChallengeList(title: "Jalan Sehat", desc: "Jalan ringan selama 10 menit, jangan lupa mandi yahh..", category: .sport),
            ChallengeList(title: "Tidak merokok hari ini!", desc: "Coba untuk tidak merokok pada hari ini. Mulai dari langkah kecil", category: .lifestyle)
        ]
    }
    
    static func getRandomChallengeList() -> ChallengeList {
        getAllChallengeList().randomElement()!
    }
}

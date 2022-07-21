//
//  Enums.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation

let kRequestChallengeModel = "RequestChallengeModel"
let kFinishTodaysChallenge = "FinishTodaysChallenge"

enum AchievemetType {
    case achieved
    case notAchieved
    case all
}

@objc
public enum ChallengeCategory: Int16 {
    case food
    case sport
    case lifestyle
}

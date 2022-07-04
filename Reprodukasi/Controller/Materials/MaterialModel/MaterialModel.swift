//
//  File.swift
//  Reprodukasi
//
//  Created by Rinaldi Alfian on 23/06/22.
//

import Foundation
import UIKit

struct Root {
    var section : [SectionMaterial]
}

struct SectionMaterial{
    var title: String
    var materials: [MaterialModel]
}

struct MaterialModel {
    var title:String!
    var detail:String!
    var image:String!
//    private let progressView: UIProgressView
    
}

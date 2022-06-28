//
//  MaterialData.swift
//  Reprodukasi
//
//  Created by Rinaldi Alfian on 23/06/22.
//

import Foundation

class MaterialData{
    
    static let shared : MaterialData = MaterialData()
    
    func fetchData()->Root{
        var arrMaterial = [MaterialModel]()
        var arrMaterial2 = [MaterialModel]()
    
        var a = MaterialModel(title: "Hayo loh yang rokok", detail: "Masa sih rokok bisa merusak kesehatan reproduksi?", image: "", percent: "50 Percent")
        arrMaterial.append(a)
        
        var b = MaterialModel(title: "Masa tidak suka ikan?", detail: "Padahal ikan enak dan bermanfaat loh! Pelajari lebih lanjut!", image: "", percent: "50 Percent")
        arrMaterial.append(b)
        
        var c = MaterialModel(title: "sunat itu baik", detail: "sunat tidak sakit lohh", image: "", percent: "50 Percent")
        arrMaterial2.append(c)
        
        var d = MaterialModel(title: "Masa tidak suka ikan?", detail: "Padahal ikan enak dan bermanfaat loh! Pelajari lebih lanjut!", image: "", percent: "50 Percent")
        arrMaterial2.append(d)
        
        var section1 = SectionMaterial(title: "Gaya Hidup", materials: arrMaterial)
        var section2 = SectionMaterial(title: "Kebersihan", materials: arrMaterial2)
        
        let root: Root = Root(section: [section1, section2])
        
        return root
    }
    
}

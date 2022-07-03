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
        var arrMaterial3 = [MaterialModel]()
        
    
        let a = MaterialModel(title: "Hayo loh yang rokok", detail: "Masa sih rokok bisa merusak kesehatan reproduksi?", image: "materiRokok")
        arrMaterial.append(a)
        
        let b = MaterialModel(title: "Olahraga intensitas tinggi tidak baik", detail: "Ha? Masa sih olahraga berintensitas tinggi itu tidak baik?", image: "materiOlahraga")
        arrMaterial.append(b)
        
        let c = MaterialModel(title: "Sabun Kewanitaan Menyebabkan Iritasi?", detail: "Yang sering menggunakan sabun kewanitaan harus baca materi ini.", image: "materiSabun")
        arrMaterial2.append(c)
        
        let d = MaterialModel(title: "Masa tidak suka ikan?", detail: "Padahal ikan enak dan bermanfaat loh! Pelajari lebih lanjut!", image: "materiIkan")
        arrMaterial3.append(d)
        
        let e = MaterialModel(title: "Pose Bridge untuk Kesehatan Reproduksi", detail: "Pose jembatan? Yakin pose ini bisa membantu kesehatan reproduksi?", image: "materiBridge")
        arrMaterial3.append(e)
        
        
        
        var section1 = SectionMaterial(title: "Gaya Hidup", materials: arrMaterial)
        var section2 = SectionMaterial(title: "Kebersihan", materials: arrMaterial2)
        var section3 = SectionMaterial(title: "Kesuburan", materials: arrMaterial3)
        
        let root: Root = Root(section: [section1, section2, section3])
        
        return root
    }
    
}

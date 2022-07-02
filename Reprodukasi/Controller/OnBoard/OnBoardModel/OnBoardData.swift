//
//  OnBoardData.swift
//  Reprodukasi
//
//  Created by Rinaldi Alfian on 02/07/22.
//

import Foundation

class OnBoardData{
    static let shared : OnBoardData = OnBoardData()
    
    func fetchData()->[OnBoardModel]{
        var arrOnboard = [OnBoardModel]()
        
        let boardOne = OnBoardModel(titleSatu: "Selamat Datang di", titleDua: "Reprodukasi", detail: "Sebuah aplikasi untuk mempelajari kesehatan reproduksi", image: "onBoard1")
        arrOnboard.append(boardOne)
        let boardTwo = OnBoardModel(titleSatu: "Pembelajaran Melalui", titleDua: "Visualisasi materi", detail: "Belajar kesehatan reproduksi secara simpel dan tidak berbelit-belit", image: "onBoard2")
        arrOnboard.append(boardTwo)
        let boardThree = OnBoardModel(titleSatu: "Aplikasikan Ilmu Dengan", titleDua: "Tantangan Harian", detail: "Aplikasikan apa yang kamu pelajari dalam kehidupan sehari-hari", image: "onBoard3")
        arrOnboard.append(boardThree)
        let boardFour = OnBoardModel(titleSatu: "Hidup Sehat Bersama", titleDua: "Reprodukasi", detail: "Ketahui cara menjaga kesehatan reproduksimu dari sekarang", image: "onBoard4")
        arrOnboard.append(boardFour)
        
        return arrOnboard
    }
        
}

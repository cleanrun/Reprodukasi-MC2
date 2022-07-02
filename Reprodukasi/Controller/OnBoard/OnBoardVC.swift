//
//  OnBoardVC.swift
//  Reprodukasi
//
//  Created by Rinaldi Alfian on 02/07/22.
//

import UIKit

class OnBoardVC: UIViewController {
    
    
    @IBOutlet weak var onBoardView: UIView!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!
    @IBOutlet weak var imageOnboard: UIImageView!
    @IBOutlet weak var detailOnboard: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var progressOnboard: UIPageControl!
    
    var data = OnBoardData.shared.fetchData()
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(index: currentPage)
        updatePageControl()

    }
    
    func updateUI(index: Int){
        labelTop.text = data[index].titleSatu
        labelBottom.text = data[index].titleDua
        detailOnboard.text = data[index].detail
        imageOnboard.image = UIImage(named: data[index].image)
    }
    
    func updatePageControl(){
        progressOnboard.currentPage = currentPage
    }
    
    func updateButton(){
            nextButton.setTitle("Mari Kita Mulai", for: .normal)
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        if currentPage < data.count {
            currentPage += 1
            updateUI(index: currentPage)
            updatePageControl()
        }
        else {
            updateButton()
            
        }
    }
    
    @IBAction func skipAction(_ sender: Any) {
//        next step
    }
}

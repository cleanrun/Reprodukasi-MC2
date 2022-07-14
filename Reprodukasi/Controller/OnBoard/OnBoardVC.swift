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
    
    init() {
        super.init(nibName: "OnBoardVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(index: currentPage)
        updatePageControl()
        skipButton.isUserInteractionEnabled = true
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
    
    func routeToMainTab() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let tabBarVC = MainTabBarVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = tabBarVC
        }, completion: nil)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if currentPage < (data.count-1) {
            currentPage += 1
            updateUI(index: currentPage)
            updatePageControl()
            if currentPage == 3 {
                updateButton()
            }
        }
        else {
            routeToMainTab()
        }
    }
    
    @IBAction func skipAction(_ sender: Any) {
        routeToMainTab()
    }
}

//
//  ProgressVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 22/06/22.
//

import UIKit

class ProgressVC: UIViewController {
    
    // MARK: - IBOutlets and UI Components
    @IBOutlet weak var progressTableView: UITableView!
    
    // MARK: - Variables
    private var challengeModel: ChallengeModel?
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "ProgressVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setCurrentChallenge()
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        title = "Progress"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        progressTableView.delegate = self
        progressTableView.dataSource = self
        progressTableView.separatorStyle = .none
        progressTableView.register(UINib(nibName: "TodaysChallengeCell", bundle: nil), forCellReuseIdentifier: "TodaysChallengeCell")
        progressTableView.register(UINib(nibName: "ContinueLearningCell", bundle: nil), forCellReuseIdentifier: "ContinueLearningCell")
    }
    
    private func setCurrentChallenge() {
        challengeModel = CoreDataRepository.current.getTodaysChallenge()
        progressTableView.reloadData()
    }
    
    // MARK: - Custom Functions
    private func switchToChallengeTab() {
        tabBarController?.selectedIndex = 2
    }
    
    // MARK: - Actions

}

extension ProgressVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? (challengeModel != nil ? 1 : 0) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodaysChallengeCell") as! TodaysChallengeCell
            cell.selectionStyle = .none
            if let challengeModel = challengeModel {
                cell.setupContents(challengeModel)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContinueLearningCell") as! ContinueLearningCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Tantangan Hari Ini" : "Pelajari Kembali"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        header.textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? TodaysChallengeCell.DEFAULT_HEIGHT : ContinueLearningCell.DEFAULT_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switchToChallengeTab()
        }
        
        if indexPath.section == 1
        {
            
            print(indexPath)
            let button = ContentVC(nibName: "ContentVC", bundle: nil)
            if indexPath == [1,0] {
                button.objects = ["siapa-yang-masih-merokok-di-sini-1","siapa-yang-masih-merokok-di-sini-2","siapa-yang-masih-merokok-di-sini-3","siapa-yang-masih-merokok-di-sini-4","siapa-yang-masih-merokok-di-sini-5","siapa-yang-masih-merokok-di-sini-6"]
            }
            
            
            button.modalPresentationStyle = .overCurrentContext
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                
                if topController is MainTabBarVC {
                    topController.present(button, animated: true)
                }

                // topController should now be your topmost view controller
            }
            
        }
    }
    
}

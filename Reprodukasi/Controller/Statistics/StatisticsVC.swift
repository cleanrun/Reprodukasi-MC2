//
//  StatisticsVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 22/06/22.
//

import UIKit

class StatisticsVC: UIViewController {
    
    // MARK: IBOutlets and UI Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "StatisticsVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - UI Setups
    private func setupTableView() {
        title = "Statistik"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "StatisticsChallengeProgressCell", bundle: nil), forCellReuseIdentifier: "StatisticsChallengeProgressCell")
        tableView.register(UINib(nibName: "StatisticsAchievementCell", bundle: nil), forCellReuseIdentifier: "StatisticsAchievementCell")
    }
    
    // MARK: - Custom Functions
    private func routeToChallengeHistory() {
        let vc = ChallengeHistoryVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func routeToAchievement() {
        let vc = AchievementVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Table View delegate and data source
extension StatisticsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsChallengeProgressCell") as! StatisticsChallengeProgressCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsAchievementCell") as! StatisticsAchievementCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return StatisticsChallengeProgressCell.DEFAULT_HEIGHT
        case 1:
            return StatisticsAchievementCell.DEFAULT_HEIGHT
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            routeToChallengeHistory()
        case 1:
            routeToAchievement()
        default:
            break
        }
    }
}

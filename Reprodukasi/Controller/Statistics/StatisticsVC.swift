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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "StatisticsLearningProgressCell", bundle: nil), forCellReuseIdentifier: "StatisticsLearningProgressCell")
        tableView.register(UINib(nibName: "StatisticsChallengeProgressCell", bundle: nil), forCellReuseIdentifier: "StatisticsChallengeProgressCell")
        tableView.register(UINib(nibName: "StatisticsAchievementCell", bundle: nil), forCellReuseIdentifier: "StatisticsAchievementCell")
    }
    
    // MARK: - Custom Functions
    
}

// MARK: - Table View delegate and data source
extension StatisticsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsLearningProgressCell") as! StatisticsLearningProgressCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1{
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
            return StatisticsLearningProgressCell.DEFAULT_HEIGHT
        case 1:
            return StatisticsChallengeProgressCell.DEFAULT_HEIGHT
        case 2:
            return StatisticsAchievementCell.DEFAULT_HEIGHT
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // FIXME: Implement this soon
    }
}

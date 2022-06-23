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
    
    // MARK: - UI Setups
    private func setupUI() {
        progressTableView.delegate = self
        progressTableView.dataSource = self
        progressTableView.separatorStyle = .none
        progressTableView.register(UINib(nibName: "TodaysChallengeCell", bundle: nil), forCellReuseIdentifier: "TodaysChallengeCell")
        progressTableView.register(UINib(nibName: "ContinueLearningCell", bundle: nil), forCellReuseIdentifier: "ContinueLearningCell")
    }
    
    // MARK: - Custom Functions
    
    // MARK: - Actions

}

extension ProgressVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodaysChallengeCell") as! TodaysChallengeCell
            cell.selectionStyle = .none
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
        // FIXME: Implement this soon
    }
    
}

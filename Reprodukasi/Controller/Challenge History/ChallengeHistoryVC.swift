//
//  ChallengeHistoryVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 28/06/22.
//

import UIKit

class ChallengeHistoryVC: UITableViewController {
    
    // MARK: - Variables
    private var filterMenuActions: [UIAction] = {
        return [
            UIAction(title: "Semua", image: nil, handler: { (_) in }),
            UIAction(title: "Selesai", image: nil, handler: { (_) in }),
            UIAction(title: "Tidak Selesai", image: nil, handler: { (_) in })
        ]
    }()
    
    private var filterMenu: UIMenu {
        UIMenu(title: "", image: nil, identifier: nil, options: [], children: filterMenuActions)
    }
    
    private var challenges: [ChallengeModel] = []
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: nil, bundle: nil)
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
        title = "Riwayat Tantangan"
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "line.3.horizontal.decrease.circle"), primaryAction: nil, menu: filterMenu)
        
        challenges = CoreDataRepository.current.getChallengeHistory()
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ChallengeHistoryCell", bundle: nil), forCellReuseIdentifier: String(describing: "ChallengeHistoryCell"))
    }
    
    // MARK: - Custom Functions
    

}

// MARK: - Table View delegate and data source
extension ChallengeHistoryVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        challenges.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeHistoryCell") as! ChallengeHistoryCell
        cell.selectionStyle = .none
        cell.setContents(challenges[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ChallengeHistoryCell.DEFAULT_HEIGHT
    }
}

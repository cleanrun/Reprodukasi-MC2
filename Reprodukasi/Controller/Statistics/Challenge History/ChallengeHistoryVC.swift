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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "line.3.horizontal.decrease.circle"), primaryAction: nil, menu: filterMenu)
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ChallengeHistoryCell", bundle: nil), forCellReuseIdentifier: String(describing: "ChallengeHistoryCell"))
    }
    
    // MARK: - Custom Functions
    

}

// MARK: - Table View delegate and data source
extension ChallengeHistoryVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "19 Juni 2022" : "18 Juni 2022"
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        header.textLabel?.textColor = .DISABLED_TEXT
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeHistoryCell") as! ChallengeHistoryCell
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ChallengeHistoryCell.DEFAULT_HEIGHT
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

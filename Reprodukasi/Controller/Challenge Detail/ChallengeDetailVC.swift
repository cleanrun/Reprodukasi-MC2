//
//  ChallengeDetailVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 24/06/22.
//

import UIKit

class ChallengeDetailVC: UIViewController {
    
    // MARK: - IBOutlet and UI Components
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var challengeActionButton: RPPrimaryButton!
    
    @IBOutlet weak var learnMoreTableView: UITableView!
    @IBOutlet weak var learnMoreTableViewHeight: NSLayoutConstraint!
    
    // MARK: - Variables

    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "ChallengeDetailVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        title = "Tantangan"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupTableView() {
        learnMoreTableView.delegate = self
        learnMoreTableView.dataSource = self
        learnMoreTableView.separatorStyle = .none
        learnMoreTableView.register(UINib(nibName: "ContinueLearningCell", bundle: nil), forCellReuseIdentifier: "ContinueLearningCell")
        learnMoreTableViewHeight.constant = ContinueLearningCell.DEFAULT_HEIGHT * 2
    }
    
    // MARK: - Custom Functions
    private func showFinishChallengeAlert() {
        let alert = UIAlertController(title: "Selesaikan tantangan", message: "Yakin udah selesai nih?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Ya", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.challengeActionButton.setTitle("Tantangan Terselesaikan", for: .normal)
            self.challengeActionButton.isUserInteractionEnabled = false
        })
        let noAction = UIAlertAction(title: "Tidak", style: .destructive)
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        
        alert.preferredAction = yesAction
        present(alert, animated: true)
    }
    
    // MARK: - Action
    @IBAction func challengeAction(_ sender: Any) {
        showFinishChallengeAlert()
    }
}

extension ChallengeDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ContinueLearningCell.DEFAULT_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContinueLearningCell") as! ContinueLearningCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // FIXME: Implement this soon
    }
}

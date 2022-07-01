//
//  CollectionHeaderView.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 01/07/22.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    static let REUSE_IDENTIFIER = "CollectionHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
    
    func setTitle(_ title: String) {
        headerLabel.text = title
    }
}

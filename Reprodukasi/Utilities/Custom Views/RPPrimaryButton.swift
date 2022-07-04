//
//  RPPrimaryButton.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 23/06/22.
//

import UIKit

@IBDesignable
class RPPrimaryButton: UIButton {
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            if isUserInteractionEnabled {
                backgroundColor = .PRIMARY_RED
                setTitleColor(.white, for: .normal)
            } else {
                backgroundColor = .init(hex: "#CEF3D7")
                setTitleColor(.init(hex: "#34C759"), for: .normal)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    private func setupLayout() {
        layer.cornerRadius = 10
        if isUserInteractionEnabled {
            backgroundColor = .PRIMARY_RED
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = .init(hex: "#CEF3D7")
            setTitleColor(.init(hex: "#34C759"), for: .normal)
        }
    }
}

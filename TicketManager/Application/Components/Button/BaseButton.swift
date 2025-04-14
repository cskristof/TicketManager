//
//  BaseButton.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 13..
//

import UIKit
import SnapKit

class BaseButton: UIButton {

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        setStyle()

        snp.makeConstraints { make in
            make.height.equalTo(Dimensions.buttonHeight)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.height / 2
    }

    func setStyle() {
        titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }

}

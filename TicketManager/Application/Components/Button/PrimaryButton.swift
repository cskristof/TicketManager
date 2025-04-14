//
//  PrimaryButton.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 13..
//

import Foundation

class PrimaryButton: BaseButton {
    
    override func setStyle() {
        super.setStyle()

        backgroundColor = .primary
        setTitleColor(.white, for: .normal)
    }

}

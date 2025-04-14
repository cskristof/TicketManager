//
//  SecondaryButton.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 13..
//

import UIKit

class SecondaryButton: BaseButton {

    override func setStyle() {
        super.setStyle()

        layer.borderColor = UIColor.primary.cgColor
        layer.borderWidth = 2
        setTitleColor(.primary, for: .normal)
    }

}

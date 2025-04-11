//
//  BaseCard.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

import UIKit

class BaseCard: BaseView {

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = Dimensions.cornerRadius
    }

}

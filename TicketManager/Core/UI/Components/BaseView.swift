//
//  BaseView.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setComponents()

        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setComponents() {}

    func makeConstraints() {}    

}

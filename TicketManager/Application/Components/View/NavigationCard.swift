//
//  NavigationCard.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit

class NavigationCard: BaseCard {

    var titleLabel: UILabel!
    var arrowImage: UIImageView!

    override func setComponents() {
        super.setComponents()

        titleLabel = UILabel()
        titleLabel.textColor = .primary
        titleLabel.font = Dimensions.titleFont
        addSubview(titleLabel)

        arrowImage = UIImageView(image: .init(systemName: "chevron.right"))
        arrowImage.setRatioToImage()
        arrowImage.tintColor = .primary
        addSubview(arrowImage)
    }

    override func makeConstraints() {
        super.makeConstraints()

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(Dimensions.pageMargin)
            make.trailing.lessThanOrEqualTo(arrowImage.snp.leading).offset(-8)
        }

        arrowImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(Dimensions.pageMargin)
            make.height.equalTo(16)
        }
    }

    func configure(title: String) {
        titleLabel.text = title
    }

}

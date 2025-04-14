//
//  CountyRowItem.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit

protocol CountyRowItemDelegate: AnyObject {
    func checkBoxStateChanged(county: County, isChecked: Bool)
}

class CountyRowItem: BaseView {

    private var county: County?

    var checkBox: UIButton!
    var titleLabel: UILabel!
    var priceLabel: UILabel!

    weak var delegate: CountyRowItemDelegate?

    override func setComponents() {
        super.setComponents()

        checkBox = UIButton()
        checkBox.tintColor = .primaryLight
        checkBox.setImage(UIImage(systemName: "square"), for: .normal)
        checkBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        checkBox.isUserInteractionEnabled = false
        addSubview(checkBox)

        titleLabel = UILabel()
        titleLabel.textColor = .primary
        titleLabel.font = .systemFont(ofSize: 14)
        addSubview(titleLabel)

        priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 14, weight: .bold)
        priceLabel.textColor = .primary
        addSubview(priceLabel)

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleCheckBox)))
    }

    override func makeConstraints() {
        super.makeConstraints()

        checkBox.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(24)
            make.leading.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkBox.snp.trailing).offset(8)
            make.trailing.lessThanOrEqualTo(priceLabel.snp.leading).offset(-8)
        }

        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    @objc
    func toggleCheckBox() {
        checkBox.isSelected.toggle()
        titleLabel.textColor = if checkBox.isSelected {
            .primaryLight
        } else {
            .primary
        }

        if let county {
            delegate?.checkBoxStateChanged(county: county, isChecked: checkBox.isSelected)
        }
    }

    func configure(county: County, price: Double) {
        self.county = county

        titleLabel.text = county.name
        priceLabel.text = String(format: "%.0f Ft", price)
    }

}

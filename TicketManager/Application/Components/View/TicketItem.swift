//
//  TicketItem.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 11..
//

import UIKit

class TicketItem: BaseView {

    var radioCircle: UIView!
    var radioFilled: UIView!
    var titleLabel: UILabel!
    var priceLabel: UILabel!

    override func setComponents() {
        super.setComponents()

        radioCircle = UIView()
        radioCircle.layer.borderColor = UIColor.primaryInactive.cgColor
        radioCircle.layer.borderWidth = 2
        addSubview(radioCircle)

        radioFilled = UIView()
        radioFilled.backgroundColor = .primary
        addSubview(radioFilled)

        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .primary
        titleLabel.numberOfLines = 2
        addSubview(titleLabel)

        priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 14, weight: .bold)
        priceLabel.textColor = .primary
        priceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        addSubview(priceLabel)

        layer.borderWidth = 2
        layer.cornerRadius = Dimensions.cornerRadius
        setSelected(false)
    }

    override func makeConstraints() {
        super.makeConstraints()

        let padding = 16

        radioCircle.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().inset(padding)
            make.top.bottom.equalToSuperview().inset(24)
        }

        radioFilled.snp.makeConstraints { make in
            make.width.height.equalTo(14)
            make.center.equalTo(radioCircle)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(radioCircle.snp.trailing).offset(padding)
            make.trailing.lessThanOrEqualTo(priceLabel.snp.leading).offset(-padding)
        }

        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(padding)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        radioCircle.layer.cornerRadius = radioCircle.frame.width / 2
        radioFilled.layer.cornerRadius = radioFilled.frame.width / 2
    }

    func setSelected(_ isSelected: Bool) {
        if isSelected {
            layer.borderColor = UIColor.primary.cgColor
        } else {
            layer.borderColor = UIColor.primaryInactive.cgColor
        }

        radioFilled.isHidden = !isSelected
    }

    func configure(vignette: HighwayVignette, vehicleCategory: VehicleCategory?) {
        titleLabel.text = if let vehicleCategory {
            "\(vehicleCategory.vignetteCategory) - \(vignette.vignetteDescription)"
        } else {
            "\(vignette.vignetteType[0])"
        }

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        let value = formatter.string(from: NSNumber(value: vignette.sum)) ?? ""
        priceLabel.text = "\(value) Ft"
    }

}

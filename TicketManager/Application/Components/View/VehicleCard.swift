//
//  VehicleCard.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

import UIKit

class VehicleCard: BaseCard {

    private var loader: UIActivityIndicatorView!
    private var content: CompressBox!
    private var carImage: UIImageView!
    private var plateNumber: UILabel!
    private var ownerName: UILabel!


    override func setComponents() {
        loader = UIActivityIndicatorView(style: .medium)
        loader.color = .primary
        addSubview(loader)

        content = CompressBox()
        addSubview(content)

        carImage = UIImageView(image: .car)
        content.addSubview(carImage)

        plateNumber = UILabel()
        plateNumber.textColor = .primary
        plateNumber.font = .systemFont(ofSize: 16, weight: .medium)
        content.addSubview(plateNumber)

        ownerName = UILabel()
        ownerName.textColor = .primary
        ownerName.font = .systemFont(ofSize: 14, weight: .light)
        content.addSubview(ownerName)
    }

    override func makeConstraints() {
        loader.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(24)
            make.top.greaterThanOrEqualToSuperview().inset(20)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
        }

        content.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().priority(990)
        }

        carImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }

        plateNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalTo(carImage.snp.trailing).offset(16)
            make.trailing.lessThanOrEqualToSuperview().inset(16)
        }

        ownerName.snp.makeConstraints { make in
            make.top.equalTo(plateNumber.snp.bottom).offset(4)
            make.leading.equalTo(plateNumber)
            make.trailing.lessThanOrEqualToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16).priority(999)
        }
    }

    func startLoading() {
        loader.startAnimating()
    }

    func configure(vehicle: VehicleModel) {
        loader.stopAnimating()

        plateNumber.text = vehicle.plate
        ownerName.text = vehicle.name
    }

}

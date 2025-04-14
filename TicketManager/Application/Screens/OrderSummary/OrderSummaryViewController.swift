//
//  OrderSummaryViewController.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit

protocol OrderSummaryViewControllerDelegate: AnyObject {

}

class OrderSummaryViewController: BaseViewController {

    var interactor: OrderSummaryViewControllerDelegate?

    override func setupCleanConnections() {
        OrderSummaryConfigurator.configure(self)
    }

    let vehicle: VehicleModel
    let vehicleCategory: VehicleCategory?
    let selectedVignette: HighwayVignette
    let selectedCounties: [County]?

    var titleLabel: UILabel!
    var plateNumber: UIStackView!
    var vignetteType: UIStackView!
    var itemList: UIStackView!
    var totalCostTitle: UILabel!
    var totalCost: UILabel!
    var continueButton: PrimaryButton!
    var cancelButton: SecondaryButton!

    init(vehicle: VehicleModel, vehicleCategory: VehicleCategory? = nil, selectedVignette: HighwayVignette, selectedCounties: [County]? = nil) {
        self.vehicle = vehicle
        self.vehicleCategory = vehicleCategory
        self.selectedVignette = selectedVignette
        self.selectedCounties = selectedCounties
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initLayout() {
        super.initLayout()

        title = String(localized: "e_ticket")

        addScrollView()

        titleLabel = UILabel()
        titleLabel.text = String(localized: "confirm_purchase")
        titleLabel.textColor = .primary
        titleLabel.font = Dimensions.titleFont
        svContent.addSubview(titleLabel)

        plateNumber = createDataLine(title: String(localized: "plate_number"),
                                     titleFont: .systemFont(ofSize: 14),
                                     value: vehicle.plate)
        svContent.addSubview(plateNumber)

        vignetteType = createDataLine(title: String(localized: "vignette_type"),
                                      titleFont: .systemFont(ofSize: 14),
                                      value: selectedVignette.vignetteDescription)
        svContent.addSubview(vignetteType)

        itemList = UIStackView()
        itemList.axis = .vertical
        itemList.spacing = 16
        itemList.distribution = .fill
        svContent.addSubview(itemList)

        fillItem()

        totalCostTitle = UILabel()
        totalCostTitle.text = String(localized: "total_cost")
        totalCostTitle.textColor = .primary
        totalCostTitle.font = .systemFont(ofSize: 12, weight: .bold)
        svContent.addSubview(totalCostTitle)

        totalCost = UILabel()
        totalCost.text = String(format: "%.0f Ft", calculateTotal())
        totalCost.textColor = .primary
        totalCost.font = .systemFont(ofSize: 40, weight: .bold)
        svContent.addSubview(totalCost)

        continueButton = PrimaryButton()
        continueButton.setTitle(String(localized: "continue"), for: .normal)
        continueButton.addTarget(self, action: #selector(continuePressed), for: .touchUpInside)
        svContent.addSubview(continueButton)

        cancelButton = SecondaryButton()
        cancelButton.setTitle(String(localized: "cancel"), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        svContent.addSubview(cancelButton)
    }

    private func createDataLine(title: String, titleFont: UIFont, value: String) -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.distribution = .equalSpacing

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = titleFont
        titleLabel.textColor = .primary
        row.addArrangedSubview(titleLabel)

        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.textColor = .primary
        valueLabel.font = .systemFont(ofSize: 14)
        row.addArrangedSubview(valueLabel)

        return row
    }

    private func fillItem() {
        if let counties = selectedCounties {
            for county in counties {
                let line = createDataLine(title: county.name,
                                          titleFont: .systemFont(ofSize: 16, weight: .bold),
                                          value: String(format: "%.0f Ft", selectedVignette.cost))
                itemList.addArrangedSubview(line)
            }
        } else {
            let title = if let vehicleCategory {
                "\(vehicleCategory.vignetteCategory) - \(selectedVignette.vignetteDescription)"
            } else {
                selectedVignette.vignetteDescription
            }
            let line = createDataLine(title: title,
                                      titleFont: .systemFont(ofSize: 16, weight: .bold),
                                      value: String(format: "%.0f Ft", selectedVignette.cost))
            itemList.addArrangedSubview(line)
        }

        let taxItem = createDataLine(title: String(localized: "system_usage_fee"),
                                 titleFont: .systemFont(ofSize: 14, weight: .medium),
                                 value: String(format: "%.0f Ft", selectedVignette.trxFee))
        itemList.addArrangedSubview(taxItem)
    }

    private func calculateTotal() -> Double {
        if let counties = selectedCounties {
            return Double(counties.count) * selectedVignette.cost + selectedVignette.trxFee
        } else {
            return selectedVignette.sum
        }
    }

    override func makeConstraints() {
        super.makeConstraints()

        let padding = Dimensions.pageMargin * 2

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.trailing.equalToSuperview().inset(padding)
        }

        plateNumber.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(padding)
        }

        vignetteType.snp.makeConstraints { make in
            make.top.equalTo(plateNumber.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(padding)
        }

        itemList.snp.makeConstraints { make in
            make.top.equalTo(vignetteType.snp.bottom).offset(52)
            make.leading.trailing.equalToSuperview().inset(padding)
        }

        totalCostTitle.snp.makeConstraints { make in
            make.top.equalTo(itemList.snp.bottom).offset(44)
            make.leading.equalToSuperview().inset(padding)
        }

        totalCost.snp.makeConstraints { make in
            make.top.equalTo(totalCostTitle.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(padding)
        }

        continueButton.snp.makeConstraints { make in
            make.top.equalTo(totalCost.snp.bottom).offset(36)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
        }

        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
            make.bottom.equalToSuperview().inset(24)
        }
    }

    @objc
    func continuePressed() {
        // TODO: Send order
        show(PaymentSuccessViewController(), sender: nil)
    }

    @objc
    func cancelPressed() {
        navigationController?.popViewController(animated: true)
    }

}

extension OrderSummaryViewController: OrderSummaryPresenterDelegate {

}

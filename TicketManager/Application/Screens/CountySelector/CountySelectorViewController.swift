//
//  CountySelectorViewController.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit

protocol CountySelectorViewControllerDelegate: AnyObject {

}

class CountySelectorViewController: BaseViewController {

    var interactor: CountySelectorViewControllerDelegate?

    override func setupCleanConnections() {
        CountySelectorConfigurator.configure(self)
    }

    let vehicle: VehicleModel
    let ticket: HighwayVignette
    let counties: [County]

    private var selectedCounties: Set<County> = []

    var titleLabel: UILabel!
    var countryImage: UIImageView!
    var countyList: UIStackView!
    var totalCostTitle: UILabel!
    var totalCost: UILabel!
    var continueButton: UIButton!

    init(vehicle: VehicleModel, ticket: HighwayVignette, counties: [County]) {
        self.vehicle = vehicle
        self.ticket = ticket
        self.counties = counties
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
        titleLabel.text = String(localized: "yearly_regional_tickets")
        titleLabel.font = Dimensions.titleFont
        titleLabel.textColor = .primary
        svContent.addSubview(titleLabel)

        countryImage = UIImageView(image: .country)
        countryImage.setRatioToImage()
        svContent.addSubview(countryImage)

        countyList = UIStackView()
        countyList.axis = .vertical
        countyList.spacing = 0
        countyList.distribution = .fill
        svContent.addSubview(countyList)

        totalCostTitle = UILabel()
        totalCostTitle.textColor = .primary
        totalCostTitle.text = String(localized: "total_cost")
        totalCostTitle.font = .systemFont(ofSize: 12, weight: .medium)
        svContent.addSubview(totalCostTitle)

        totalCost = UILabel()
        totalCost.text = "0 Ft"
        totalCost.textColor = .primary
        totalCost.font = .systemFont(ofSize: 30, weight: .bold)
        svContent.addSubview(totalCost)

        continueButton = PrimaryButton()
        continueButton.setTitle(String(localized: "continue"), for: .normal)
        continueButton.addTarget(self, action: #selector(continuePressed), for: .touchUpInside)
        svContent.addSubview(continueButton)

        for county in counties {
            let item = CountyRowItem()
            item.configure(county: county, price: ticket.cost)
            item.delegate = self
            countyList.addArrangedSubview(item)
        }
    }

    override func makeConstraints() {
        super.makeConstraints()

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin * 2)
        }

        countryImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin * 2)
        }

        countyList.snp.makeConstraints { make in
            make.top.equalTo(countryImage.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin * 2)
        }

        totalCostTitle.snp.makeConstraints { make in
            make.top.equalTo(countyList.snp.bottom).offset(44)
            make.leading.equalToSuperview().inset(Dimensions.pageMargin * 2)
        }

        totalCost.snp.makeConstraints { make in
            make.top.equalTo(totalCostTitle.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(Dimensions.pageMargin * 2)
        }

        continueButton.snp.makeConstraints { make in
            make.top.equalTo(totalCost.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
            make.bottom.equalToSuperview().inset(24)
        }
    }

    private func refreshTotal() {
        let total: Double = Double(selectedCounties.count) * ticket.cost
        totalCost.text = String(format: "%.0f Ft", total)
    }

    @objc
    func continuePressed() {
    }

}

extension CountySelectorViewController: CountyRowItemDelegate {

    func checkBoxStateChanged(county: County, isChecked: Bool) {
        if isChecked {
            selectedCounties.insert(county)
        } else {
            selectedCounties.remove(county)
        }
        refreshTotal()
    }

}

extension CountySelectorViewController: CountySelectorPresenterDelegate {

}

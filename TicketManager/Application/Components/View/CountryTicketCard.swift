//
//  CountryTicketsView.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 11..
//

import UIKit

protocol CountryTicketCardDelegate: AnyObject {
    func purchaseTicket(_ ticket: HighwayVignette)
}

class CountryTicketCard: BaseCard {

    var titleLabel: UILabel!
    var options: UIStackView!
    var purchaseButton: UIButton!

    weak var delegate: CountryTicketCardDelegate?
    var selectedTicket: HighwayVignette? {
        if activeIndex < vignettes.count {
            return vignettes[activeIndex]
        }

        return nil
    }
    private var activeIndex: Int = 0

    private var vignettes: [HighwayVignette] = []
    private var vehicleCategory: VehicleCategory?

    private var ticketItems: [TicketItem] = []

    override func setComponents() {
        super.setComponents()

        titleLabel = UILabel()
        titleLabel.textColor = .primary
        titleLabel.text = String(localized: "country_tickets")
        titleLabel.font = Dimensions.titleFont
        addSubview(titleLabel)

        options = UIStackView()
        options.axis = .vertical
        options.distribution = .fill
        options.spacing = 8
        addSubview(options)

        purchaseButton = PrimaryButton()
        purchaseButton.setTitle(String(localized: "purchase"), for: .normal)
        purchaseButton.addTarget(self, action: #selector(purchaseButtonTapped), for: .touchUpInside)
        addSubview(purchaseButton)
    }

    override func makeConstraints() {
        super.makeConstraints()

        let padding = 16

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(Dimensions.pageMargin)
        }

        options.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(padding)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
        }

        purchaseButton.snp.makeConstraints { make in
            make.top.equalTo(options.snp.bottom).offset(padding)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
            make.bottom.equalToSuperview().inset(padding)
        }
    }

    @objc
    private func purchaseButtonTapped() {
        if let selectedTicket {
            delegate?.purchaseTicket(selectedTicket)
        }
    }

    func configure(vignettes: [HighwayVignette], vehicleCategory: VehicleCategory?) {
        self.vignettes = vignettes
        self.vehicleCategory = vehicleCategory

        options.arrangedSubviews.forEach { options.removeArrangedSubview($0) }
        ticketItems = []

        for vignette in vignettes {
            let item = TicketItem()
            item.configure(vignette: vignette, vehicleCategory: vehicleCategory)
            options.addArrangedSubview(item)
            ticketItems.append(item)

            item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(itemSelected)))
        }
        setActiveIndex(0)
    }

    @objc
    func itemSelected(_ gesture: UIGestureRecognizer) {
        if let view = gesture.view as? TicketItem, let index = ticketItems.firstIndex(of: view) {
            setActiveIndex(index)
        }
    }

    private func setActiveIndex(_ index: Int) {
        for (i, item) in ticketItems.enumerated() {
            item.setSelected(i == index)
        }
        activeIndex = index
    }

}

//
//  TicketSelectorViewController.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

import UIKit

protocol TicketSelectorViewControllerDelegate: AnyObject {

}

class TicketSelectorViewController: BaseViewController {

    var interactor: TicketSelectorViewControllerDelegate?

    override func setupCleanConnections() {
        TicketSelectorConfigurator.configure(self)
    }

    struct ScreenData {
        let vehicle: VehicleModel
        let vehicleCategories: [VehicleCategory]
        let highwayTickets: [HighwayVignette]
        let counties: [County]
    }

    let screenData: ScreenData
    
    private var vehicleCard: VehicleCard!
    private var countryTicketCard: CountryTicketCard!
    private var regionalNavigationCard: NavigationCard!

    init(screenData: ScreenData) {
        self.screenData = screenData
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func initLayout() {
        super.initLayout()

        title = String(localized: "e_ticket")
        view.backgroundColor = .screenBackground

        addScrollView()

        vehicleCard = VehicleCard()
        vehicleCard.configure(vehicle: screenData.vehicle)
        svContent.addSubview(vehicleCard)

        countryTicketCard = CountryTicketCard()
        countryTicketCard.delegate = self
        countryTicketCard.configure(vignettes: screenData.highwayTickets.filter { $0.vignetteType.count == 1 },
                                    vehicleCategories: screenData.vehicleCategories)
        svContent.addSubview(countryTicketCard)

        regionalNavigationCard = NavigationCard()
        regionalNavigationCard.configure(title: String(localized: "yearly_regional_tickets"))
        regionalNavigationCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigationCardPressed)))
        svContent.addSubview(regionalNavigationCard)
    }

    override func makeConstraints() {
        super.makeConstraints()

        vehicleCard.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
        }

        countryTicketCard.snp.makeConstraints { make in
            make.top.equalTo(vehicleCard.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
        }

        regionalNavigationCard.snp.makeConstraints { make in
            make.top.equalTo(countryTicketCard.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin)
            make.bottom.equalToSuperview().inset(32)
        }
    }

    @objc
    func navigationCardPressed() {
        show(PaymentSuccessViewController(), sender: nil)
    }

}

extension TicketSelectorViewController: CountryTicketCardDelegate {

    func purchaseTicket(_ ticket: HighwayVignette) {
        // TODO: Navigate to details screen
    }

}

extension TicketSelectorViewController: TicketSelectorPresenterDelegate {

}

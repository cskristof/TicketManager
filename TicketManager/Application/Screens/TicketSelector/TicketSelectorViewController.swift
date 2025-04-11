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

    private var vehicleCard: VehicleCard!

    override func initLayout() {
        super.initLayout()

        view.backgroundColor = .screenBackground

        addScrollView()

        vehicleCard = VehicleCard()
        svContent.addSubview(vehicleCard)
    }

    override func makeConstraints() {
        super.makeConstraints()

        vehicleCard.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }

}

extension TicketSelectorViewController: TicketSelectorPresenterDelegate {

}

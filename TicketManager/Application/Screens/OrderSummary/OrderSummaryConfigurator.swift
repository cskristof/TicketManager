//
//  OrderSummaryConfigurator.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

class OrderSummaryConfigurator {

    static func configure(_ screen: OrderSummaryViewController) {
        let presenter = OrderSummaryPresenter()
        presenter.viewController = screen

        let interactor = OrderSummaryInteractor()
        interactor.presenter = presenter

        screen.interactor = interactor
    }

}

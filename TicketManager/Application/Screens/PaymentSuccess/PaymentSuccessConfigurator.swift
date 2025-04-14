//
//  PaymentSuccessConfigurator.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

class PaymentSuccessConfigurator {

    static func configure(_ screen: PaymentSuccessViewController) {
        let presenter = PaymentSuccessPresenter()
        presenter.viewController = screen

        let interactor = PaymentSuccessInteractor()
        interactor.presenter = presenter

        screen.interactor = interactor
    }

}

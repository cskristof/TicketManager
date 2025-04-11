//
//  TicketSelectorConfigurator.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

class TicketSelectorConfigurator {

    static func configure(_ screen: TicketSelectorViewController) {
        let presenter = TicketSelectorPresenter()
        presenter.viewController = screen

        let interactor = TicketSelectorInteractor()
        interactor.presenter = presenter

        screen.interactor = interactor
    }

}

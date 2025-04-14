//
//  CountySelectorConfigurator.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

class CountySelectorConfigurator {

    static func configure(_ screen: CountySelectorViewController) {
        let presenter = CountySelectorPresenter()
        presenter.viewController = screen

        let interactor = CountySelectorInteractor()
        interactor.presenter = presenter

        screen.interactor = interactor
    }

}

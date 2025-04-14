//
//  SplashConfigurator.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

class SplashConfigurator {

    static func configure(_ screen: SplashViewController) {
        let presenter = SplashPresenter()
        presenter.viewController = screen

        let interactor = SplashInteractor()
        interactor.presenter = presenter

        screen.interactor = interactor
    }

}

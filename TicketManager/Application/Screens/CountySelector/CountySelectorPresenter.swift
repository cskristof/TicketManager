//
//  CountySelectorPresenter.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol CountySelectorPresenterDelegate: AnyObject {

}

class CountySelectorPresenter: CountySelectorInteractorDelegate {

    weak var viewController: CountySelectorPresenterDelegate?

}

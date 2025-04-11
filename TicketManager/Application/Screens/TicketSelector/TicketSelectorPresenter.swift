//
//  TicketSelectorPresenter.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

protocol TicketSelectorPresenterDelegate: AnyObject {

}

class TicketSelectorPresenter: TicketSelectorInteractorDelegate {

    weak var viewController: TicketSelectorPresenterDelegate?

}

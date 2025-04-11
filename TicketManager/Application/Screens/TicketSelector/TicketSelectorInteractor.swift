//
//  TicketSelectorInteractor.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

protocol TicketSelectorInteractorDelegate: AnyObject {

}

class TicketSelectorInteractor: TicketSelectorViewControllerDelegate {

    var presenter: TicketSelectorInteractorDelegate?

}

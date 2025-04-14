//
//  CountySelectorInteractor.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol CountySelectorInteractorDelegate: AnyObject {

}

class CountySelectorInteractor: CountySelectorViewControllerDelegate {

    var presenter: CountySelectorInteractorDelegate?

}

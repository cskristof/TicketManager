//
//  OrderSummaryPresenter.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol OrderSummaryPresenterDelegate: AnyObject {

}

class OrderSummaryPresenter: OrderSummaryInteractorDelegate {

    weak var viewController: OrderSummaryPresenterDelegate?

}

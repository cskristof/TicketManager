//
//  OrderSummaryInteractor.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol OrderSummaryInteractorDelegate: AnyObject {

}

class OrderSummaryInteractor: OrderSummaryViewControllerDelegate {

    var presenter: OrderSummaryInteractorDelegate?

}

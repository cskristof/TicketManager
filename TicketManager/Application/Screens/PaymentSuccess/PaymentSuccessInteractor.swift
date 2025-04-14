//
//  PaymentSuccessInteractor.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol PaymentSuccessInteractorDelegate: AnyObject {

}

class PaymentSuccessInteractor: PaymentSuccessViewControllerDelegate {

    var presenter: PaymentSuccessInteractorDelegate?

}

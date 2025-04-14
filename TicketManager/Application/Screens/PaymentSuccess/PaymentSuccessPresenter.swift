//
//  PaymentSuccessPresenter.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol PaymentSuccessPresenterDelegate: AnyObject {

}

class PaymentSuccessPresenter: PaymentSuccessInteractorDelegate {

    weak var viewController: PaymentSuccessPresenterDelegate?

}

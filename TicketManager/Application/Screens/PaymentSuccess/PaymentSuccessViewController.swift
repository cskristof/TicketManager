//
//  PaymentSuccessViewController.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit

protocol PaymentSuccessViewControllerDelegate: AnyObject {

}

class PaymentSuccessViewController: BaseViewController {

    var interactor: PaymentSuccessViewControllerDelegate?

    override func setupCleanConnections() {
        PaymentSuccessConfigurator.configure(self)
    }

    private var confettiImage: UIImageView!
    private var successLabel: UILabel!
    private var manImage: UIImageView!
    private var button: UIButton!

    override func initLayout() {
        super.initLayout()

        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .yettelGreen

        confettiImage = UIImageView(image: .confetti)
        confettiImage.setRatioToImage()
        view.addSubview(confettiImage)

        successLabel = UILabel()
        successLabel.text = String(localized: "successful_transaction")
        successLabel.font = .systemFont(ofSize: 36, weight: .bold)
        successLabel.textColor = .primary
        successLabel.numberOfLines = 0
        view.addSubview(successLabel)

        manImage = UIImageView(image: .man)
        manImage.setRatioToImage()
        view.addSubview(manImage)

        button = PrimaryButton()
        button.setTitle(String(localized: "ok"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(button)

        view.bringSubviewToFront(confettiImage)
    }

    override func makeConstraints() {
        super.makeConstraints()

        confettiImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        successLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.75)
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin * 2)
        }

        manImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalTo(button.snp.top).offset(-32)
            make.height.equalToSuperview().multipliedBy(0.33)
        }

        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Dimensions.pageMargin * 1)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
        }
    }

    @objc
    func buttonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension PaymentSuccessViewController: PaymentSuccessPresenterDelegate {

}

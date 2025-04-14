//
//  SplashViewController.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit

protocol SplashViewControllerDelegate: AnyObject {
    func fetchRequiredData()
}

class SplashViewController: BaseViewController {

    var interactor: SplashViewControllerDelegate?

    override func setupCleanConnections() {
        SplashConfigurator.configure(self)
    }

    var appLogo: UIImageView!
    var loader: UIActivityIndicatorView!

    override func initLayout() {
        super.initLayout()

        view.backgroundColor = .yettelGreen

        appLogo = UIImageView(image: .highway)
        appLogo.setRatioToImage()
        view.addSubview(appLogo)

        loader = UIActivityIndicatorView(style: .large)
        loader.color = .white
        view.addSubview(loader)
    }

    override func makeConstraints() {
        super.makeConstraints()

        appLogo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.4)
        }

        loader.snp.makeConstraints { make in
            make.top.equalTo(appLogo.snp.bottom).offset(52)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(48)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loader.startAnimating()
        interactor?.fetchRequiredData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.isNavigationBarHidden = false
    }

}

extension SplashViewController: SplashPresenterDelegate {
    func navigateToTicketSelector(data: TicketSelectorViewController.ScreenData) {
        navigationController?.setViewControllers([TicketSelectorViewController(screenData: data)], animated: true)
    }
}

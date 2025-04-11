//
//  BaseViewController.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 09..
//

import UIKit
import SnapKit

protocol BaseViewControllerProtocol: UIViewController {
    func initLayout()
    func makeConstraints()
    func refreshContent()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {

    var scrollView: UIScrollView!
    var svContent: UIView!
    var pagingEnabled: Bool = true

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.backButtonTitle = ""

        setupCleanConnections()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCleanConnections() {}

    // MARK: Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initLayout()

        makeConstraints()

        setNeedsStatusBarAppearanceUpdate()
    }

    func initLayout() {
        view.backgroundColor = .white
    }

    func makeConstraints() {}

    func refreshContent() {}

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if presentedViewController != nil {
            dismiss(animated: false) {
                super.present(viewControllerToPresent, animated: flag, completion: completion)
            }
        } else {
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }

}

extension BaseViewController {

    func addScrollView() {
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        // scrollView.contentInsetAdjustmentBehavior = .always
        view.addSubview(scrollView)

        svContent = UIView()
        scrollView.addSubview(svContent)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        svContent.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.edges.equalToSuperview()
        }
    }

}

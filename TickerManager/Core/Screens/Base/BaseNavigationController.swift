//
//  BaseNavigationController.swift
//  TickerManager
//
//  Created by Csapó Kristóf on 2025. 04. 09..
//

import UIKit

class BaseNavigationController: UINavigationController {

    override var childForStatusBarStyle: UIViewController? {
        return viewControllers.last
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        let poppedViewController = super.popViewController(animated: animated)

        if let poppedViewController = poppedViewController {
            if let visibleViewController = topViewController as? BaseViewController {
                visibleViewController.refreshContent()
                interactivePopGestureRecognizer?.isEnabled = visibleViewController.pagingEnabled
            }
        }

        return poppedViewController
    }

}

extension BaseNavigationController: UINavigationBarDelegate {

    func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        if let navigationBarDelegate = viewControllers.last as? UINavigationBarDelegate,
           let shouldPush = navigationBarDelegate.navigationBar?(navigationBar, shouldPush: item) {
            return shouldPush
        }

        return true
    }

    func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        if let base = viewControllers.last as? BaseViewController {
            interactivePopGestureRecognizer?.isEnabled = base.pagingEnabled
        }
    }

    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if let navigationBarDelegate = viewControllers.last as? UINavigationBarDelegate,
           let shouldPush = navigationBarDelegate.navigationBar?(navigationBar, shouldPop: item) {
            return shouldPush
        }

        return true
    }

}

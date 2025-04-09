//
//  SceneDelegate.swift
//  TickerManager
//
//  Created by Csapó Kristóf on 2025. 04. 09..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let customAppearance = createNavBarAppearance()
        let appearance = UINavigationBar.appearance()
        appearance.standardAppearance = customAppearance
        appearance.compactAppearance = customAppearance
        appearance.scrollEdgeAppearance = customAppearance
        appearance.compactScrollEdgeAppearance = customAppearance

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = BaseNavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func createNavBarAppearance() -> UINavigationBarAppearance {
        let backgroundColor = UIColor.yettelGreen
        let fontColor = UIColor.font

        let customNavBarAppearance = UINavigationBarAppearance()

        // Apply background.
        customNavBarAppearance.configureWithOpaqueBackground()
        customNavBarAppearance.backgroundColor = backgroundColor

        // Apply white colored normal and large titles.
        customNavBarAppearance.titleTextAttributes = [.foregroundColor: fontColor]
        customNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: fontColor]

        // Apply white color to all the nav bar buttons.
        let barButtonItemAppearance = UIBarButtonItemAppearance(style: .plain)
        barButtonItemAppearance.normal.titleTextAttributes = [.foregroundColor: fontColor]
        barButtonItemAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.darkText]
        barButtonItemAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.label]
        barButtonItemAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.white]
        customNavBarAppearance.buttonAppearance = barButtonItemAppearance
        customNavBarAppearance.backButtonAppearance = barButtonItemAppearance
        customNavBarAppearance.doneButtonAppearance = barButtonItemAppearance

        return customNavBarAppearance
    }

    func setRootViewController(_ viewController: UIViewController, animated: Bool = false) {
        guard let window = self.window else { return }

        window.rootViewController = viewController

        if animated {
            let options: UIView.AnimationOptions = .transitionCrossDissolve

            let duration: TimeInterval = 0.3

            UIView.transition(with: window, duration: duration, options: options, animations: nil, completion: nil)
        }
    }


}


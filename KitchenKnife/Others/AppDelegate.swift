//
//  AppDelegate.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // Override point for customization after application launch.
        setMainWindow()
        return true
    }

    // MARK: - Helper
    private func setMainWindow() {
        if Storage.FirstLogin.getLogin() {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = MainTabBarViewController()
            window?.makeKeyAndVisible()
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = OnboardingViewController()
            window?.makeKeyAndVisible()
        }
    }

}

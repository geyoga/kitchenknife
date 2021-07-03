//
//  MainTabBarViewController.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 03/07/21.
//

import UIKit
import PromiseKit

enum MainTabBarItem: Int {
    case home
    case saved
}

struct TabBar {
    let type: MainTabBarItem
    let image: UIImage
    let selectedImage: UIImage
    let controller: UIViewController
}

final class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Properties

    private let tabBars: [TabBar] = [
//        (.home, Asset.Main.homeIdle.image, Asset.Main.homeActive.image, ViewController()),
//        (.saved, Asset.Main.savedIdle.image, Asset.Main.saveActive.image, ViewController())
    ].map(TabBar.init)
     //swiftlint:enable line_length

    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()

    // MARK: - Life Cyclyes

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBars()
        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)


    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let newTabBarHeight = defaultTabBarHeight + UIStyle.Inset.inset12

        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight

        tabBar.frame = newFrame
    }

    // MARK: - Private Functions

    fileprivate func setupTabBars() {
        tabBar.barTintColor = Asset.Color.white.color.withAlphaComponent(0.9)
        tabBar.tintColor = Asset.Color.black.color
        tabBar.shadowImage = nil
        tabBar.backgroundImage = nil
        tabBar.layer.borderColor = Asset.Color.lightGrey.color.cgColor
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor(red:0.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha:0.2).cgColor
        tabBar.clipsToBounds = true

        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = tabBar.bounds
        blurView.autoresizingMask = .flexibleWidth
        tabBar.insertSubview(blurView, at: 0)

        var tagCounter = 0
        tabBars.forEach({
            let tabBarItem = UITabBarItem(title: "", image: $0.image, selectedImage: $0.selectedImage)
            tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -7)
            tabBarItem.tag = tagCounter
            tabBarItem.image = tabBarItem.image?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)

            $0.controller.tabBarItem = tabBarItem
            tagCounter += 1
        })
        self.viewControllers = tabBars.map({
            return UINavigationController(rootViewController: $0.controller)
        })
    }

    // MARK: - Public Functions

    func selectTab(index: MainTabBarItem) {
        self.selectedIndex = index.rawValue
    }

    func getTabBarView(index: MainTabBarItem) -> UIView? {
        guard let tabBar = tabBar.items?[index.rawValue],
            let tabBarView = tabBar.value(forKey: "view") else { return nil }

        return tabBarView as? UIView
    }

    func getMainController(index: MainTabBarItem) -> UIViewController? {
        return viewControllers?[index.rawValue]

    }

}

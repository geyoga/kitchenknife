//
//  BaseViewController.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 02/07/21.
//

import UIKit
import NavKit

/// Base View Controller
class BaseViewController: UIViewController, CustomizableNavigation, UIGestureRecognizerDelegate {

    // MARK: - Properties

    lazy var scrollView: BaseScrollView = {
        let scrollView = BaseScrollView()

        return scrollView
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    open var enablePreferredStatusBarColor: Bool { return true }
    open var preferredStatusBarColor: UIColor { return .clear}

    // MARK: - Navigation Configs

    var titleFont: UIFont { return .bold24 }
    var titleColor: UIColor { return Asset.Color.black.color }
    var barBackgroundColor: UIColor { return view.backgroundColor ?? .clear }
    var backImage: UIImage? { return Asset.General.back.image }
    var isBarUsingBottomShadow: Bool { return false }
    var backInset: UIEdgeInsets? { return .init(top: 5, left: 0, bottom: 5, right: 25) }
    var isUsingInteractivePopGesture: Bool { return true }

    // MARK: - Open Variables

    open var shouldAttachScrollView: Bool { return true }

    // MARK: - Open Functions

    @objc dynamic open func initializeUI() {}
    @objc dynamic open func updateViews() {}
    @objc dynamic open func setupViews() {}
    @objc dynamic open func setupActions() {}
    @objc dynamic open func fetchData() {}
    @objc dynamic open func updateButtonState() {}

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        if shouldAttachScrollView {
            attachScrollView()
        }
        initializeUI()
        setupViews()
        setupActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateNavigation()

        updateViews()

        updateStatusBar()
    }

    // MARK: - View Creation

    private func attachScrollView() {
        view.addSubview(scrollView)
        scrollView.fillSuperviewSafeAreaLayoutGuide()
    }

    // MARK: - Private Functions

    fileprivate func updateStatusBar() {
        let tag: Int = 726264
        if #available(iOS 13, *) {
            // remove current status bar
            UIApplication.shared.windows.first { $0.isKeyWindow }?.viewWithTag(tag)?.removeFromSuperview()
        } else {
            UIApplication.shared.statusBarView?.backgroundColor = .clear
        }

        if enablePreferredStatusBarColor {
            if #available(iOS 13, *) {
                let statusBarManager = UIApplication.shared.windows.first {
                    $0.isKeyWindow }?.windowScene?.statusBarManager
                guard let statusBarFrame = statusBarManager?.statusBarFrame else {
                    return
                }
                let statusBar = UIView(frame: statusBarFrame)
                statusBar.tag = tag
                statusBar.backgroundColor = preferredStatusBarColor
                UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(statusBar)
            } else {
                UIApplication.shared.statusBarView?.backgroundColor = preferredStatusBarColor
            }
        }
    }
}

extension UIViewController {
    @discardableResult
    func fadeFromColor(fromColor: UIColor, toColor: UIColor, withPercentage: CGFloat) -> UIColor {
        var fromRed: CGFloat = 0.0
        var fromGreen: CGFloat = 0.0
        var fromBlue: CGFloat = 0.0
        var fromAlpha: CGFloat = 0.0

        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)

        var toRed: CGFloat = 0.0
        var toGreen: CGFloat = 0.0
        var toBlue: CGFloat = 0.0
        var toAlpha: CGFloat = 0.0

        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)

        //calculate the actual RGBA values of the fade colour
        let red = (toRed - fromRed) * withPercentage + fromRed
        let green = (toGreen - fromGreen) * withPercentage + fromGreen
        let blue = (toBlue - fromBlue) * withPercentage + fromBlue
        let alpha = (toAlpha - fromAlpha) * withPercentage + fromAlpha

        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 987654321
            guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
                let statusBarFrame = keyWindow.windowScene?.statusBarManager?.statusBarFrame else {
                return nil
            }

            if let statusBarView = keyWindow.viewWithTag(tag) {
                return statusBarView
            }

            let statusBar = UIView()
            statusBar.frame = statusBarFrame
            keyWindow.addSubview(statusBar)

            return statusBar
        } else {
            return value(forKey: "statusBar") as? UIView
        }
    }
}

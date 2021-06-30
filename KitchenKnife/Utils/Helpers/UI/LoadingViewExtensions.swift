//
//  LoadingViewExtensions.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit
import SnapKit
import PromiseKit
import MBProgressHUD

class LoadingView: UIView {}

extension UIViewController {
    @discardableResult
    func showLoading(message: String = "L10n.loadingPleaseWait", overWindow: Bool = true) -> Guarantee<Bool> {
        var frame = self.view.frame
        if overWindow {
            frame = UIApplication.shared.keyWindow?.frame ?? .zero
        }
        let viewsBackground = LoadingView.init(frame: frame)
        viewsBackground.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        if overWindow {
            UIApplication.shared.keyWindow?.addSubview(viewsBackground)
        } else {
            self.view.addSubview(viewsBackground)
        }
        let loadingSpinner = MBProgressHUD.showAdded(to: viewsBackground, animated: true)
        loadingSpinner.mode = .text
        loadingSpinner.label.text = ""
        loadingSpinner.bezelView.color = .clear
        loadingSpinner.bezelView.style = .solidColor
        loadingSpinner.contentColor = .clear

        return Guarantee { resolver in
            resolver(true)
        }
    }

    func hideLoading() {
        self.view.subviews
            .filter({ $0.isKind(of: LoadingView.self)})
            .forEach({
                MBProgressHUD.hide(for: $0, animated: true)
                $0.removeFromSuperview()
            })
        UIApplication.shared.keyWindow?.subviews
            .filter({ $0.isKind(of: LoadingView.self)})
            .forEach({
                MBProgressHUD.hide(for: $0, animated: true)
                $0.removeFromSuperview()
            })
    }
}

extension UIView {
    enum LoadingPosition {
        case top
        case center
    }

    static let loadingViewTag = 283982932
    static let loadingOverlayViewTag = 827162616

    func hideLoading() {
        let loadingIndicator = self.viewWithTag(UIView.loadingViewTag)
        let overlayView = self.viewWithTag(UIView.loadingOverlayViewTag)
        loadingIndicator?.removeFromSuperview()
        overlayView?.removeFromSuperview()
    }

    @discardableResult
    func showLoading(position: LoadingPosition = .center, withOverlay: Bool = false) -> Guarantee<Bool> {
        hideLoading()

        // overlay
        let overlay = UIView()
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlay.tag = UIView.loadingOverlayViewTag
        if withOverlay {
            self.addSubview(overlay)
            overlay.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
        }

        let loadingContainer = UIView()
        loadingContainer.tag = UIView.loadingViewTag
        self.addSubview(loadingContainer)
        switch position {
        case .top:
            loadingContainer.snp.makeConstraints { (maker) in
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview()
            }
        case .center:
            loadingContainer.snp.makeConstraints { (maker) in
                maker.centerX.equalToSuperview()
                maker.centerY.equalToSuperview()
            }
        }

        // add default activity indicator
        if #available(iOS 13.0, *) {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.startAnimating()
            loadingContainer.addSubview(activityIndicator)
            activityIndicator.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
        } else {
            // Fallback on earlier versions
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.startAnimating()
            loadingContainer.addSubview(activityIndicator)
            activityIndicator.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
        }

        return Guarantee { resolver in
            resolver(true)
        }
    }
}

extension UIView {
    @discardableResult
    func showLoadingBlocker(
        message: String = "L10n.loadingPleaseWait"
    ) -> Guarantee<Bool> {
        let viewsBackground = LoadingView.init(frame: self.frame)
        viewsBackground.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(viewsBackground)
        viewsBackground.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }

        let loadingSpinner = MBProgressHUD.showAdded(to: viewsBackground, animated: true)
        loadingSpinner.mode = .text
        loadingSpinner.label.text = ""
        loadingSpinner.bezelView.color = .clear
        loadingSpinner.bezelView.style = .solidColor
        loadingSpinner.contentColor = .clear

        return Guarantee { resolver in
            resolver(true)
        }
    }

    func hideLoadingBlocker() {
        self.subviews
            .filter({ $0.isKind(of: LoadingView.self)})
            .forEach({
                MBProgressHUD.hide(for: $0, animated: true)
                $0.removeFromSuperview()
            })
    }
}

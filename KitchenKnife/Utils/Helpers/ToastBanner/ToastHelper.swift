//
//  ToastHelper.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 03/07/21.
//

import UIKit
import NotificationBannerSwift

extension UIViewController {
    func showWarningBanner(message: String) {

        let banner = FloatingNotificationBanner(
            title: "L10n.error",
            subtitle: message,
            titleFont: .bold18,
            titleColor: Asset.Color.white.color,
            titleTextAlign: .left,
            subtitleFont: .regular15,
            subtitleColor: Asset.Color.white.color,
            subtitleTextAlign: .left,
            leftView: view,
            rightView: nil,
            style: .warning,
            colors: .none,
            iconPosition: .center
        )
        banner.duration = 2
        banner.show(
            queuePosition: .back,
            bannerPosition: .top,
            cornerRadius: 16)
    }
    func showSuccessBanner(message: String) {

        let banner = FloatingNotificationBanner(
            title: "L10n.success",
            subtitle: message,
            titleFont: .bold18,
            titleColor: Asset.Color.white.color,
            titleTextAlign: .left,
            subtitleFont: .regular15,
            subtitleColor: Asset.Color.white.color,
            subtitleTextAlign: .left,
            leftView: view,
            rightView: nil,
            style: .success,
            colors: .none,
            iconPosition: .top
        )
        banner.duration = 2
        banner.show(
            queuePosition: .back,
            bannerPosition: .top,
            cornerRadius: 16)
    }
}

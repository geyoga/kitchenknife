//
//  OnboardingLayout.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 04/07/21.
//

import Foundation

extension OnboardingViewController {

    // MARK: - Initialize UI
    override func initializeUI() {
        super.initializeUI()

        view.addSubview(onboardingCollectionViewController.view)
        onboardingCollectionViewController.view.fillSuperview()

        view.addSubview(skipLoginButton)
        skipLoginButton.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(UIStyle.Inset.inset24)
            maker.bottom.equalTo(
                skipLoginButton.superview!.safeAreaLayoutGuide.snp.bottom
            ).inset(UIStyle.Inset.inset48)
        }

        if #available(iOS 13.0, *) {
            view.addSubview(appleSignInButton)
            appleSignInButton.snp.makeConstraints { (maker) in
                maker.bottom.equalTo(skipLoginButton.snp.top).inset(-UIStyle.Inset.inset24)
                maker.centerX.equalToSuperview()
                maker.height.equalTo(44)
                maker.width.equalTo(300)
            }
        }
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(UIStyle.Inset.inset24)
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(skipLoginButton.snp.top).inset(-120)
        }
    }
}

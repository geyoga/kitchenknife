//
//  OnboardingViewController.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 04/07/21.
//

import UIKit
import AuthenticationServices

private typealias `Self` = OnboardingViewController

class OnboardingViewController: BaseViewController {

    // MARK: - Properties

    lazy var onboardingCollectionViewController: OnboardingCollectionViewController = {
        let controller = OnboardingCollectionViewController()
        controller.delegate = self

        return controller
    }()
    lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.pageIndicatorTintColor = Asset.Color.white.color.withAlphaComponent(0.5)
        control.currentPageIndicatorTintColor = Asset.Color.white.color
        control.isUserInteractionEnabled = false

        return control
    }()
    @available(iOS 13.0, *)
    lazy var appleSignInButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton(
            authorizationButtonType: .signIn,
            authorizationButtonStyle: .white
        )
        button.cornerRadius = 5

        return button
    }()
    lazy var skipLoginButton: UIButton = {
        let button = UIButton(type: .system)
        if #available(iOS 13.0, *) {
            button.setTitle(L10n.skipNow, for: .normal)
        } else {
            button.setTitle(L10n.chooseCategoryAction, for: .normal)
        }
        button.titleLabel?.font = .regular15
        button.setTitleColor(Asset.Color.white.color, for: .normal)
        button.titleLabel?.textAlignment = .center

        return button
    }()

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingCollectionViewController.items = OnboardingModel.setData()
        pageControl.numberOfPages = onboardingCollectionViewController.items.count
        pageControl.currentPage = 0
    }
    // MARK: - Helpers
}

// MARK: Onboarding Collection Delegate

extension Self: OnboardingCollectionDelegate {
    func onboardingCollectionViewController(
        _ onboardingCollectionViewController: OnboardingCollectionViewController,
        didScrollAt page: Int
    ) {
        pageControl.currentPage = page
    }
}

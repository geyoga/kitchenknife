//
//  OnboardingModel.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 04/07/21.
//

import UIKit

struct OnboardingModel {
    let image: UIImage
    let title: String
    let description: String

    static func setData() -> [OnboardingModel] {
        return [
            OnboardingModel(
                image: Asset.Onboarding.cellOne.image,
                title: L10n.onboardingTitleOne,
                description: L10n.onboardingDescOne
            ),
            OnboardingModel(
                image: Asset.Onboarding.cellTwo.image,
                title: L10n.onboardingTitleTwo,
                description: ""
            ),
            OnboardingModel(
                image: Asset.Onboarding.cellThree.image,
                title: L10n.onboardingTitleThree,
                description: ""
            )
        ]
    }
}

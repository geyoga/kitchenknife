//
//  OnboardingCell.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 04/07/21.
//

import UIKit
import LBTATools

class OnboardingCell: LBTAListCell<OnboardingModel> {

    // MARK: - Properties

    lazy var titleLabel: UILabel = {
        let label = UILabel(
            text: "",
            font: .bold40,
            textColor: Asset.Color.white.color,
            textAlignment: .left,
            numberOfLines: 0
        )

        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(
            text: "",
            font: .regular23,
            textColor: Asset.Color.white.color,
            textAlignment: .left,
            numberOfLines: 0
        )

        return label
    }()
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image?.withRenderingMode(.alwaysOriginal)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = UIStyle.CornerRadius.radius5

        return image
    }()
    override var item: OnboardingModel! {
        didSet {
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            backgroundImageView.image = item.image
        }
    }
    let titleInset: CGFloat = UIScreen.main.bounds.height * 0.3

    // MARK: - Life Cycles

    override func setupViews() {
        super.setupViews()

        addSubview(backgroundImageView)
        backgroundImageView.fillSuperview()
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(UIStyle.Inset.inset24)
            maker.top.equalToSuperview().inset(titleInset)
        }
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(UIStyle.Inset.inset24)
            maker.top.equalTo(titleLabel.snp.bottom).inset(-UIStyle.Inset.inset8)
        }
    }
}

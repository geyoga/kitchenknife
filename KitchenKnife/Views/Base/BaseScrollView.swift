//
//  BaseScrollView.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit
import SnapKit

class BaseScrollView: UIScrollView {

    // MARK: - Properties

    lazy var contentView: UIView = {
        let contentView = UIView()

        return contentView
    }()

    // MARK: - Iniliazers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        addSubview(contentView)
        contentView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.height.equalToSuperview().priority(.low)
            maker.width.equalToSuperview()
        }
    }

    func addSubviewToContentView(_ view: UIView) {
        contentView.addSubview(view)
    }

}

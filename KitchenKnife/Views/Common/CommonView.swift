//
//  CommonView.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

class CommonView: BaseView, SeparableCornerRadius {

    // MARK: - Separable Corner Radius Properties

    @IBInspectable var radii: CGFloat = 0 {
        didSet {
            self.updateCornerRadius()
        }
    }

    @IBInspectable var affectAllCorner: Bool = false {
        didSet {
            self.updateCornerRadius()
        }
    }

    @IBInspectable var affectTopLeftCorner: Bool = false {
        didSet {
            self.updateCornerRadius()
        }
    }

    @IBInspectable var affectTopRightCorner: Bool = false {
        didSet {
            self.updateCornerRadius()
        }
    }

    @IBInspectable var affectBottomLeftCorner: Bool = false {
        didSet {
            self.updateCornerRadius()
        }
    }

    @IBInspectable var affectBottomRightCorner: Bool = false {
        didSet {
            self.updateCornerRadius()
        }
    }

    // MARK: - Life Cycles

    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateCornerRadius()
    }
}

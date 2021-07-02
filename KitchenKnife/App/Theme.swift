//
//  Theme.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

extension UIFont {
    static var bold40: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 40)
    }
    static var bold24: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 24)
    }
    static var bold19: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 19)
    }
    static var bold18: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 18)
    }
    static var bold16: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 16)
    }
    static var bold14: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 14)
    }
    static var bold12: UIFont {
        return FontFamily.HelveticaNeue.bold.font(size: 12)
    }
    static var regular23: UIFont {
        return FontFamily.HelveticaNeue.regular.font(size: 23)
    }
    static var regular16: UIFont {
        return FontFamily.HelveticaNeue.regular.font(size: 16)
    }
    static var regular15: UIFont {
        return FontFamily.HelveticaNeue.regular.font(size: 15)
    }
    static var regular12: UIFont {
        return FontFamily.HelveticaNeue.regular.font(size: 12)
    }
    static var medium24: UIFont {
        return FontFamily.HelveticaNeue.medium.font(size: 24)
    }
    static var medium18: UIFont {
        return FontFamily.HelveticaNeue.medium.font(size: 18)
    }
    static var medium16: UIFont {
        return FontFamily.HelveticaNeue.medium.font(size: 16)
    }
}

class Theme: NSObject {

    // MARK: - Initializer

    static let shared: Theme = {
        let theme = Theme()
        theme.initialize()

        return theme
    }()

    private func initialize() {}

    // MARK: - Configs

    func config () {}

}

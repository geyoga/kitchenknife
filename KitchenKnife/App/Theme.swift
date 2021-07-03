//
//  Theme.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

struct UIStyle {

    enum Inset {
        static let inset4: CGFloat = 4.0
        static let inset8: CGFloat = 8.0
        static let inset12: CGFloat = 12.0
        static let inset16: CGFloat = 16.0
        static let inset20: CGFloat = 20.0
        static let inset24: CGFloat = 24.0
        static let inset32: CGFloat = 32.0
        static let inset40: CGFloat = 40.0
        static let inset48: CGFloat = 48.0
    }
    enum CornerRadius {
        static let radius5: CGFloat = 5.0
        static let radius8: CGFloat = 8.0
        static let radius12: CGFloat = 12.0
    }
}

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

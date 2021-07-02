//
//  FontFamily.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 02/07/21.
//

import UIKit

struct FontFamily {

    enum HelveticaNeue: String {
        case regular = "HelveticaNeue"
        case italic = "HelveticaNeue-Italic"
        case ultraLight = "HelveticaNeue-UltraLight"
        case ultraLightItalic = "HelveticaNeue-UltraLightItalic"
        case thin = "HelveticaNeue-Thin"
        case thinItalic = "HelveticaNeue-ThinItalic"
        case light = "HelveticaNeue-Light"
        case lightItalic = "HelveticaNeue-LightItalic"
        case medium = "HelveticaNeue-Medium"
        case mediumItalic = "HelveticaNeue-MediumItalic"
        case bold = "HelveticaNeue-Bold"
        case boldItalic = "HelveticaNeue-BoldItalic"
        case condensedBold = "HelveticaNeue-CondensedBold"
        case condensedBlack = "HelveticaNeue-CondensedBlack"

        func font(size: CGFloat) -> UIFont {
            return UIFont(name: self.rawValue, size: size)!
        }
    }
}

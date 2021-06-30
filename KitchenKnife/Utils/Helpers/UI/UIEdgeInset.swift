//
//  UIEdgeInset.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

extension UIEdgeInsets {
    static public func top(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: 0, bottom: 0, right: 0)
    }

    static public func left(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: side, bottom: 0, right: 0)
    }

    static public func bottom(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: side, right: 0)
    }

    static public func right(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: side)
    }

    static public func topBottom(top: CGFloat, bottom: CGFloat) -> UIEdgeInsets {
        return .init(top: top, left: 0, bottom: bottom, right: 0)
    }

    static public func leftRight(left: CGFloat, right: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: left, bottom: 0, right: right)
    }

    static public func topBottomSides(_ sides: CGFloat) -> UIEdgeInsets {
        return .init(top: sides, left: 0, bottom: sides, right: 0)
    }

    static public func leftRightSides(_ sides: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: sides, bottom: 0, right: sides)
    }
}

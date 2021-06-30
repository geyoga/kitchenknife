//
//  SeparableCornerRadius.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

protocol SeparableCornerRadius: class {
    var radii: CGFloat { get set }
    var affectAllCorner: Bool { get set }
    var affectTopLeftCorner: Bool { get set }
    var affectTopRightCorner: Bool { get set }
    var affectBottomLeftCorner: Bool { get set }
    var affectBottomRightCorner: Bool { get set }

    func updateCornerRadius()
}

extension SeparableCornerRadius where Self: UIView {
    func updateCornerRadius() {
        var corners: UIRectCorner = []

        if affectAllCorner {
            corners = [.allCorners]
        } else {
            if affectTopLeftCorner {
                corners.insert(.topLeft)
            }

            if affectTopRightCorner {
                corners.insert(.topRight)
            }

            if affectBottomLeftCorner {
                corners.insert(.bottomLeft)
            }

            if affectBottomRightCorner {
                corners.insert(.bottomRight)
            }
        }

        guard !corners.isEmpty && radii != 0 else {
            return
        }

        let layer = CAShapeLayer()
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radii, height: radii))

        layer.frame = self.bounds
        layer.path = path.cgPath

        self.layer.mask = layer
    }
}

//
//  UIView+Layout.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit
import LBTATools

@available(iOS 11.0, tvOS 11.0, *)
extension UIView {

    fileprivate func _vstack(
        _ axis: NSLayoutConstraint.Axis = .vertical,
        views: [UIView],
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }

    @discardableResult
    open func vstack(
        _ views: UIView...,
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        return _vstack(
            .vertical,
            views: views,
            spacing: spacing,
            alignment: alignment,
            distribution: distribution
        )
    }

    open func addSubViews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }

}

extension UIView {
    // swiftlint:disable implicit_getter
    var idView: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }

    func view(withId id: String) -> UIView? {
        if self.idView == id {
            return self
        }
        for view in self.subviews {
            if let view = view.view(withId: id) {
                return view
            }
        }
        return nil
    }
}

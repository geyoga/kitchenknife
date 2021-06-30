//
//  TableViewCell.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
open class TableViewCell<T>: UITableViewCell {
    open var item: T!

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    open func setupViews() {}

    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

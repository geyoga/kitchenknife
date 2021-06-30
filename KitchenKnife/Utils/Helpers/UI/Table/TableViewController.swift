//
//  TableViewController.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
open class TableViewController<T: TableViewCell<U>, U>: UITableViewController {

    fileprivate let cellId = "cellId"

    open var items = [U]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            tableView.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
        }
        tableView.register(T.self, forCellReuseIdentifier: cellId)
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    open override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! T
        cell.item = items[indexPath.row]
        return cell
    }

    required public init() {
        super.init(style: .plain)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

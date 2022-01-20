//
//  GenericTableViewDataSource.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation
import UIKit

class GenericTableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource {

    private let cellID: String
    private var items: [T] = []
    var configureCell: (CELL, T) -> () = {_,_ in }

    init(with cellID: String,
         items: [T],
         configureCell: @escaping (CELL, T) -> Void) {
        self.cellID = cellID
        self.items = items
        self.configureCell = configureCell
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID,
                                                       for: indexPath) as? CELL else {
            return UITableViewCell()
        }

        configureCell(cell, items[indexPath.row])
        return cell
    }

}

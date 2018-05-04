import SwiftViewModels
import UIKit

public class ReusableTableViewDataSource: NSObject, UITableViewDataSource {
    var presentableViewModels = [[AnyTableViewPresentableViewModel]]()

    public func present(presentableViewModels: [[AnyTableViewPresentableViewModel]], on tableView: UITableView) {
        self.presentableViewModels = presentableViewModels

        presentableViewModels.flatMap { $0 }.forEach { $0.registerCellCallback(tableView) }

        tableView.reloadData()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presentableViewModels[indexPath.section][indexPath.row].dequeueAndPresentCellCallback(tableView)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentableViewModels[section].count
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return presentableViewModels.count
    }
}

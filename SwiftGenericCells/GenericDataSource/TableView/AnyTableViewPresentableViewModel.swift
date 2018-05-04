import UIKit

extension PresentableViewModel where Presenter: UITableViewCell {
    public var any: AnyTableViewPresentableViewModel {
        return AnyTableViewPresentableViewModel(base: self)
    }
}

public class AnyTableViewPresentableViewModel {
    let dequeueAndPresentCellCallback: (UITableView) -> UITableViewCell
    let registerCellCallback: (UITableView) -> Void

    public init<Presenter: ViewModelPresenter>(base: PresentableViewModel<Presenter>) where Presenter: UITableViewCell {
        self.dequeueAndPresentCellCallback = { (tableView: UITableView) -> UITableViewCell in
            tableView.dequeueAndPresent(presentableViewModel: base, for: IndexPath(item: 0, section: 0))
        }

        self.registerCellCallback = { (tableView: UITableView) in
            tableView.register(cell: Presenter.self, reusableCellSource: Presenter.source)
        }
    }
}

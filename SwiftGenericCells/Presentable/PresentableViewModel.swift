import SwiftViewModels
import Foundation

public struct PresentableViewModel<Presenter: ViewModelPresenter> {
    var viewModel: Presenter.ViewModel

    public init(viewModel: Presenter.ViewModel) {
        self.viewModel = viewModel
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

public class AnyCollectionViewPresentableViewModel {
    let dequeueAndPresentCellCallback: (UICollectionView) -> UICollectionViewCell
    let registerCellCallback: (UICollectionView) -> Void

    public init<Presenter: ViewModelPresenter>(base: PresentableViewModel<Presenter>) where Presenter: UICollectionViewCell {
        self.dequeueAndPresentCellCallback = { (collectionView: UICollectionView) -> UICollectionViewCell in
            collectionView.dequeueAndPresent(presentableViewModel: base, for: IndexPath(item: 0, section: 0))
        }

        self.registerCellCallback = { (collectionView: UICollectionView) in
            collectionView.register(cell: Presenter.self, reusableCellSource: Presenter.source)
        }
    }
}

import ReusableDataSource
import SwiftViewModels
import SwiftGenericCells
import UIKit

class ViewController: UITableViewController {
    let dataSource = ReusableTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        let array = [
            ReusableViewModel<TitleTableViewCell>(viewModel: TitleTableViewCellViewModel(titleViewModel: "asdas")).anyPresentable,
            ReusableViewModel<TitleTableViewCell>(viewModel: TitleTableViewCellViewModel(titleViewModel: "asdasdasdasdasd")).anyPresentable,
            ReusableViewModel<ImageTitleTableViewCell>(
                viewModel: ImageTitleTableViewCellViewModel(
                    titleViewModel: "sadas",
                    imageViewModel: ImageViewModel(image: #imageLiteral(resourceName: "filter"), viewViewModel: ViewViewModel())
                )
            ).anyPresentable
        ]

        tableView.dataSource = dataSource

        dataSource.present(presentableViewModels: array, on: tableView)
    }
}

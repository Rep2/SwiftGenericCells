import SwiftViewModels
import SwiftGenericCells
import UIKit

class ViewController: UITableViewController {
    let dataSource = ReusableTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        let anyPresentableViewModel = AnyTableViewPresentableViewModel(base: PresentableViewModel<TitleTableViewCell>(viewModel: TitleTableViewCellViewModel(titleViewModel: TextViewModel(text: "asdas"))))
        let anyPresentableViewModel2 = AnyTableViewPresentableViewModel(base: PresentableViewModel<TitleTableViewCell>(viewModel: TitleTableViewCellViewModel(titleViewModel: TextViewModel(text: "asdasdasdasdasd"))))

        let array = [anyPresentableViewModel, anyPresentableViewModel2]

        tableView.dataSource = dataSource

        dataSource.present(presentableViewModels: [array], on: tableView)
    }
}

import SwiftViewModels
import SwiftGenericCells
import UIKit

class ViewController: UITableViewController {
    let dataSource = ReusableTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        let array = [
            PresentableViewModel<TitleTableViewCell>(viewModel: TitleTableViewCellViewModel(titleViewModel: TextViewModel(text: "asdas"))).any,
            PresentableViewModel<TitleTableViewCell>(viewModel: TitleTableViewCellViewModel(titleViewModel: TextViewModel(text: "asdasdasdasdasd"))).any,
            PresentableViewModel<ImageTitleTableViewCell>(
                viewModel: ImageTitleTableViewCellViewModel(
                    titleViewModel: TextViewModel(text: "sadas"),
                    imageViewModel: ImageViewModel(image: #imageLiteral(resourceName: "filter"), viewViewModel: ViewViewModel())
                )
            ).any
        ]

        tableView.dataSource = dataSource

        dataSource.present(presentableViewModels: [array], on: tableView)
    }
}

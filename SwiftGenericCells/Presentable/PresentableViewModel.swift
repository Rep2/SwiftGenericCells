import SwiftViewModels
import Foundation

public struct PresentableViewModel<Presenter: ViewModelPresenter> {
    var viewModel: Presenter.ViewModel

    public init(viewModel: Presenter.ViewModel) {
        self.viewModel = viewModel
    }
}

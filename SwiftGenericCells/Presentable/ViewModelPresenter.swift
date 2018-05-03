protocol ViewModelPresenter {
    associatedtype ViewModel

    var source: ViewSource { get }

    func present(viewModel: ViewModel)
}

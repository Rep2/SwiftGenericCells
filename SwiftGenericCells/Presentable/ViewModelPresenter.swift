public protocol ViewModelPresenter {
    associatedtype ViewModel

    static var source: ViewSource { get }

    func present(viewModel: ViewModel)
}

extension ViewModelPresenter {
    public static var source: ViewSource {
        return .class
    }
}

import UIKit

extension PresentableViewModel where Presenter: UICollectionViewCell {
    public var any: AnyCollectionViewPresentableViewModel {
        return AnyCollectionViewPresentableViewModel(base: self)
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

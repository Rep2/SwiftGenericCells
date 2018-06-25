import ReusableDataSource
import SwiftViewModels
import UIKit
import SnapKit

public struct ImageCollectionViewCellViewModel {
    let imageViewModel: ImageViewModel
}

open class ImageCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        return UIImageView(frame: .zero)
    }()

    open func setupCell() {
        addSubviews()
        layout()
    }

    open func addSubviews() {
        addSubview(imageView)
    }

    open func layout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ImageCollectionViewCell: ReusablePresenter {
    public func present(viewModel: ImageCollectionViewCellViewModel) {
        if imageView.superview == nil {
            setupCell()
        }

        viewModel.imageViewModel.apply(toImageView: imageView)
    }
}

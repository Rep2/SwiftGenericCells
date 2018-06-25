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

    public func present(viewModel: ImageCollectionViewCellViewModel) {
        if imageView.superview == nil {
            setupCell()
        }

        viewModel.imageViewModel.apply(toImageView: imageView)
    }

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

import SwiftViewModels
import UIKit
import SnapKit

public struct ImageCollectionViewCellViewModel {
    let imageViewModel: ImageViewModel
}

public class ImageCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        return UIImageView(frame: .zero)
    }()

    public func present(viewModel: ImageCollectionViewCellViewModel) {
        if imageView.superview == nil {
            setupCell()
        }

        viewModel.imageViewModel.apply(toImageView: imageView)
    }

    func setupCell() {
        addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

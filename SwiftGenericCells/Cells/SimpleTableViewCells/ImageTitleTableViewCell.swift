import ReusableDataSource
import SwiftViewModels
import SnapKit
import UIKit

public class ImageTitleTableViewCellViewModel {
    public let titleViewModel: TextViewModel
    public let imageViewModel: ImageViewModel

    public init(titleViewModel: TextViewModel, imageViewModel: ImageViewModel) {
        self.titleViewModel = titleViewModel
        self.imageViewModel = imageViewModel
    }
}

public class ImageTitleTableViewCell: UITableViewCell, ReusablePresenter {
    lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 15)

        return label
    }()

    lazy var customImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)

        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    public override func layoutSubviews() {
        super.layoutSubviews()

        contentView.addSubview(customImageView)
        contentView.addSubview(titleLabel)

        customImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.centerY.equalTo(contentView)
            make.height.width.equalTo(24)
        }

        titleLabel.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.left.equalTo(customImageView.snp.right).offset(16)
            make.centerY.equalTo(contentView)
        }
    }

    public func present(viewModel: ImageTitleTableViewCellViewModel) {
        viewModel.titleViewModel.apply(toLabel: titleLabel)
        viewModel.imageViewModel.apply(toImageView: customImageView)
    }
}
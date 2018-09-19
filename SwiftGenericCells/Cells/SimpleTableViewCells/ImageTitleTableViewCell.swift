import ReusableDataSource
import SwiftViewModels
import SnapKit
import UIKit

public class ImageTitleTableViewCellViewModel {
    public let titleViewModel: TextViewModel
    public let imageViewModel: ImageViewModel

    public let cellViewModel: TableViewCellViewModel?

    public init(titleViewModel: TextViewModel, imageViewModel: ImageViewModel, cellViewModel: TableViewCellViewModel? = nil) {
        self.titleViewModel = titleViewModel
        self.imageViewModel = imageViewModel
        self.cellViewModel = cellViewModel
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

    public func present(viewModel: ImageTitleTableViewCellViewModel) {
        if titleLabel.superview == nil {
            setupCell()
        }

        viewModel.titleViewModel.apply(to: titleLabel)
        viewModel.imageViewModel.apply(toImageView: customImageView)

        accessoryType = viewModel.cellViewModel?.accessoryType ?? .none
    }

    public func setupCell() {
        addSubviews()
        setupConstraints()
    }

    public func addSubviews() {
        addSubview(customImageView)
        addSubview(titleLabel)
    }

    public func setupConstraints() {
        customImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16))
            make.width.equalTo(customImageView.snp.height)
        }

        titleLabel.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.left.equalTo(customImageView.snp.right).offset(16)
            make.centerY.equalTo(contentView)
        }
    }
}

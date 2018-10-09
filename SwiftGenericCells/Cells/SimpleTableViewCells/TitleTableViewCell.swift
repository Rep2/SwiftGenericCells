import ReusableDataSource
import SwiftViewModels
import SnapKit
import UIKit

public class TitleTableViewCellViewModel {
    public let titleViewModel: TextViewModel
    public let cellViewModel: TableViewCellViewModel?

    public init(titleViewModel: TextViewModel, cellViewModel: TableViewCellViewModel? = nil) {
        self.titleViewModel = titleViewModel
        self.cellViewModel = cellViewModel
    }
}

public class TitleTableViewCell: UITableViewCell, ReusablePresenter {
    lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 15)

        return label
    }()

    public func present(viewModel: TitleTableViewCellViewModel) {
        if titleLabel.superview == nil {
            setupCell()
        }

        viewModel.titleViewModel.apply(to: titleLabel)

        viewModel.cellViewModel?.apply(to: self)
    }

    public func setupCell() {
        addSubviews()
        setupConstraints()
    }

    public func addSubviews() {
        addSubview(titleLabel)
    }

    public func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16))
            make.centerY.equalToSuperview()
        }
    }
}

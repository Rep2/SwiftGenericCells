import ReusableDataSource
import SwiftViewModels
import SnapKit
import UIKit

public class TitleTableViewCellViewModel {
    public let titleViewModel: TextViewModel

    public init(titleViewModel: TextViewModel) {
        self.titleViewModel = titleViewModel
    }
}

public class TitleTableViewCell: UITableViewCell, ReusablePresenter {
    lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 15)

        return label
    }()

    public override func layoutSubviews() {
        super.layoutSubviews()

        contentView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.centerY.equalTo(contentView)
        }
    }

    public func present(viewModel: TitleTableViewCellViewModel) {
        viewModel.titleViewModel.apply(toLabel: titleLabel)
    }
}

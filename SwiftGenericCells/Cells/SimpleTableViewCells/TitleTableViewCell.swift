import SwiftViewModels
import SnapKit
import UIKit

public struct TitleTableViewCellViewModel {
    public let titleViewModel: TextViewModel

    public init(titleViewModel: TextViewModel) {
        self.titleViewModel = titleViewModel
    }
}

public class TitleTableViewCell: UITableViewCell, ViewModelPresenter {
    typealias ViewModel = TitleTableViewCellViewModel

    let source = ViewSource.class

    lazy var titleLabel: UILabel = {
        return UILabel()
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

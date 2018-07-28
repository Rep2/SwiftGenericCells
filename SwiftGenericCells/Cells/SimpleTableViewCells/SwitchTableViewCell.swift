import ReusableDataSource
import SwiftViewModels
import SnapKit
import UIKit

public class SwitchTableViewCellViewModel {
    public let titleViewModel: TextViewModel
    public let switchViewModel: SwitchViewModel

    public let cellViewModel: TableViewCellViewModel?

    public init(titleViewModel: TextViewModel, switchViewModel: SwitchViewModel, cellViewModel: TableViewCellViewModel? = nil) {
        self.titleViewModel = titleViewModel
        self.switchViewModel = switchViewModel
        self.cellViewModel = cellViewModel
    }
}

public class SwitchTableViewCell: UITableViewCell, ReusablePresenter {
    lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 15)

        return label
    }()

    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch(frame: .zero)

        switchControl.addTarget(self, action: #selector(switchValueUpdated), for: .valueChanged)

        return switchControl
    }()

    var viewModel: SwitchTableViewCellViewModel?

    public func present(viewModel: SwitchTableViewCellViewModel) {
        self.viewModel = viewModel

        if titleLabel.superview == nil {
            setupCell()
        }

        viewModel.titleViewModel.apply(toLabel: titleLabel)
        viewModel.switchViewModel.apply(toSwitch: switchControl)

        accessoryType = viewModel.cellViewModel?.accessoryType ?? .none
    }

    public func setupCell() {
        addSubviews()
        setupConstraints()
    }

    public func addSubviews() {
        addSubview(titleLabel)
        addSubview(switchControl)
    }

    public func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        switchControl.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 16))
            make.left.equalTo(titleLabel.snp.right).offset(16)
        }
    }

    @objc
    func switchValueUpdated() {
        viewModel?.switchViewModel.isOnValueChangedCallback?(switchControl.isOn)
    }
}

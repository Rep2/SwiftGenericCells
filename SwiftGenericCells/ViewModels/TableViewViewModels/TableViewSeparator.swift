import UIKit

public enum TableViewSeparator {
    case top
    case bottom
    case middle

    func layout(separator: UIView) {
        switch self {
        case .top:
            separator.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
                make.height.equalTo(1)
            }
        case .bottom:
            separator.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
        case .middle:
            separator.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
                make.height.equalTo(1)
            }
        }
    }
}

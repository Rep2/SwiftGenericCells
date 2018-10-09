import UIKit

public enum TableViewSeparator {
    case top
    case bottom
    case middle

    func apply(to view: UIView) {
        let separator = UIView.separator
        view.addSubview(separator)

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

extension UIView {
    static let separatorColor = #colorLiteral(red: 0.5843137255, green: 0.6235294118, blue: 0.6549019608, alpha: 0.2)

    static var separator: UIView {
        let view = UIView(frame: .zero)

        view.backgroundColor = UIView.separatorColor

        return view
    }
}

import UIKit

public enum TableViewSeparator {
    case top(isInset: Bool)
    case bottom(isInset: Bool)

    func apply(to view: UIView) {
        let separator = UIView.separator
        view.addSubview(separator)

        let isInset: Bool
        switch self {
        case .top(let inset):
            isInset = inset

            separator.snp.makeConstraints { make in
                make.top.equalToSuperview()
            }
        case .bottom(let inset):
            isInset = inset

            separator.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
            }
        }

        let inset = UIEdgeInsets(top: 0, left: isInset ? 16 : 0, bottom: 0, right: 0)

        separator.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(inset)
            make.height.equalTo(1)
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

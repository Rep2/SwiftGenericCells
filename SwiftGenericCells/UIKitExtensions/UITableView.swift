import UIKit

extension UITableView {
    /**
     Registers a reusable "cell" using `CustomStringConvertible` as the reuese identifier.

     - Important: Call before `dequeueReusableCell(for:)` to avoid `NSInternalInconsistencyException`.
     */
    func register<T: UITableViewCell>(cell: T.Type, reusableCellSource: ReusableCellSource) {
        switch reusableCellSource {
        case .nib:
            register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
        case .class:
            register(T.self, forCellReuseIdentifier: String(describing: cell.self))
        }
    }

    /**
     Returns a "cell" of a given type using `CustomStringConvertible` as the reuese identifier.

     - Important: Force unwraps the "cell". Causes the app to crashes with `NSInternalInconsistencyException` if the cell type isn't registered.
     */
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(for: indexPath)!
    }

    /**
     Returns an optional "cell" of a given type using `CustomStringConvertible` as the reuese identifier.

     - Important: Causes the app to crashes with `NSInternalInconsistencyException` if the cell type isn't registered.
     */
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
    }
}

public struct TableViewCellViewModel {
    public let accessoryType: UITableViewCellAccessoryType?

    public let separator: TableViewSeparator?

    public init(accessoryType: UITableViewCellAccessoryType?, separator: TableViewSeparator? = nil) {
        self.accessoryType = accessoryType
        self.separator = separator
    }

    public func apply(to cell: UITableViewCell) {
        if let accessoryType = accessoryType {
            cell.accessoryType = accessoryType
        }

        separator?.apply(to: cell)
    }
}

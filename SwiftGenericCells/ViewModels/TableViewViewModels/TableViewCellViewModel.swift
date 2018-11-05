public struct TableViewCellViewModel {
    public let accessoryType: UITableViewCellAccessoryType?

    public let separators: [TableViewSeparator]

    public init(accessoryType: UITableViewCellAccessoryType?, separators: [TableViewSeparator] = []) {
        self.accessoryType = accessoryType
        self.separators = separators
    }

    public func apply(to cell: UITableViewCell) {
        if let accessoryType = accessoryType {
            cell.accessoryType = accessoryType
        }

        separators.forEach { $0.apply(to: cell) }
    }
}

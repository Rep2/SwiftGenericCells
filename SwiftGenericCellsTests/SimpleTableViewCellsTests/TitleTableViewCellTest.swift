import UIKit
import XCTest
import Nimble
@testable import SwiftGenericCells

class TitleTableViewCellTest: XCTestCase {
    let tableView = UITableView()

    func test_TitleTableViewCellTest_OptionalDequeue() {
        tableView.register(cell: TitleTableViewCell.self, reusableCellSource: .class)

        let cell: TitleTableViewCell? = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0))

        expect(cell).toNot(beNil())
    }

    func test_TitleTableViewCellTest_Dequeue() {
        tableView.register(cell: TitleTableViewCell.self, reusableCellSource: .class)

        let cell: TitleTableViewCell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0))

        expect(cell).toNot(beNil())
    }
}

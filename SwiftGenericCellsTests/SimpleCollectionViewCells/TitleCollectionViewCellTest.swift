import UIKit
import XCTest
import Nimble
@testable import SwiftGenericCells

class TitleCollectionViewCellTest: XCTestCase {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    func test_TitleTableViewCellTest_OptionalDequeue() {
        collectionView.register(cell: TitleCollectionViewCell.self, reusableCellSource: .class)

        let cell: TitleCollectionViewCell? = collectionView.dequeueReusableCell(for: IndexPath(row: 0, section: 0))

        expect(cell).toNot(beNil())
    }

    func test_TitleTableViewCellTest_Dequeue() {
        collectionView.register(cell: TitleCollectionViewCell.self, reusableCellSource: .class)

        let cell: TitleCollectionViewCell = collectionView.dequeueReusableCell(for: IndexPath(row: 0, section: 0))

        expect(cell).toNot(beNil())
    }
}

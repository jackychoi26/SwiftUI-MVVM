//
//  GetDeliveriesTests.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import XCTest
@testable import SwiftUI_MVVM

class GetDeliveriesTests: XCTestCase {

    var sut: GetDeliveries!

    func test_ReturnsDeliveries_When_DeliveriesAreGiven() async {
        let repository = MockDeliveriesRepository()
        repository.stubbedGetResult = [.stub(id: "test1"), .stub(id: "test2")]
        sut = .init(repository: repository)

        let result = await sut.execute(offset: 2)

        XCTAssertTrue(repository.invokedGetDeliveries)
        XCTAssertEqual(repository.invokedGetDeliveriesCount, 1)
        XCTAssertEqual(repository.invokedGetDeliveriesParametersOffset, 2)
        XCTAssertEqual(repository.invokedGetDeliveriesParametersLimit, 10)
        XCTAssertEqual(result.first?.id, "test1")
        XCTAssertEqual(result[1].id, "test2")
    }
}

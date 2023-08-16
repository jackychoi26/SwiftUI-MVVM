//
//  DeliveriesRepositoryTests.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import XCTest
@testable import SwiftUI_MVVM

class DeliveriesRepositoryTests: XCTestCase {

    var sut: DeliveriesRepositoryImpl!

    func test_ReturnsLocalDeliveries_When_LocalCachesAreFound() async {
        // Arrange
        let localStorage = MockDeliveriesLocalStorage()
        let webservice = MockDeliveriesWebservice()
        localStorage.stubbedGetResult = [.stub(id: "testing1"), .stub(id: "testing2")]
        sut = .init(localStorage: localStorage, webservice: webservice)

        // Act
        let result = await sut.getDeliveries()

        // Assert
        XCTAssertTrue(localStorage.invokedGet)
        XCTAssertFalse(webservice.invokedPerformRequest)
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.first?.id, "testing1")
        XCTAssertEqual(result[1].id, "testing2")
    }

    func test_ReturnsWebserviceDeliveries_When_LocalCachesAreNotFound() async {
        // Arrange
        let localStorage = MockDeliveriesLocalStorage()
        let webservice = MockDeliveriesWebservice()
        localStorage.stubbedGetResult = nil
        webservice.stubbedGetResult = [.stub(id: "test1"), .stub(id: "test2")]
        sut = .init(localStorage: localStorage, webservice: webservice)

        // Act
        let result = await sut.getDeliveries()

        // Assert
        XCTAssertTrue(webservice.invokedPerformRequest)
        XCTAssertTrue(localStorage.invokedGet)
        XCTAssertEqual(localStorage.invokedGetCount, 1)

        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.first?.id, "test1")
        XCTAssertEqual(result[1].id, "test2")
    }
}


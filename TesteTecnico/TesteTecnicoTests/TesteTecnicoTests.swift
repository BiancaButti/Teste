//
//  TesteTecnicoTests.swift
//  TesteTecnicoTests
//
//  Created by Bianca on 22/07/23.
//

import XCTest
@testable import TesteTecnico

final class TesteTecnicoTests: XCTestCase {

    private var mockAPIService = TransferService()
    private var sut = TransferViewModel()
    
    init(withSut sut: TransferViewModel) {
        self.sut = sut
        super.init()
    }
    
    override func setUp() {
        super.setUp()
        mockAPIService = TransferService()
        sut = TransferViewModel(service: mockAPIService)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_readJSONFile_WithMock() {
        let mock = mockAPIService.readJSONFile()
        XCTAssertTrue((mock != nil))
    }
}

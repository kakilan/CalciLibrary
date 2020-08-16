//
//  CalciLibraryTests.swift
//  CalciLibraryTests
//
//  Created by Akilan on 16/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import XCTest
@testable import CalciLibrary

class CalciLibraryTests: XCTestCase {
    
    var mockRemoteConfigService: MockRemoteConfigService!
    var mockBitCoinService: MockBitCoinService!
    var mockReverseGeocodeService: MockReverseGeocodeService!
    
    var calculator: Calculator!
    
    override func setUpWithError() throws {
        mockRemoteConfigService = MockRemoteConfigService()
        mockBitCoinService = MockBitCoinService()
        mockReverseGeocodeService = MockReverseGeocodeService()
    }
    
    override func tearDownWithError() throws {
        mockRemoteConfigService = nil
        mockBitCoinService = nil
        mockReverseGeocodeService = nil
        
        calculator = nil
    }
    
    func testAddWithValidOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "80"
        let actual = calculator.add(operand1: "40", and: "40")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithValidDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "122.72"
        let actual = calculator.add(operand1: "90.16", and: "32.56")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithIncompleteDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "42"
        let actual = calculator.add(operand1: "38.", and: "4")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithInvalidOperandsShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.add(operand1: "32", and: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithLargeDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "6.33946"
        let actual = calculator.add(operand1: "3.216", and: "3.12346")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithValidOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "25"
        let actual = calculator.subtract(operand1: "75", and: "50")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithValidDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "3.3204"
        let actual = calculator.subtract(operand1: "6.465", and: "3.1446")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithInvalidOperandsShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.subtract(operand1: "20", and: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithLargeDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "1.96785"
        let actual = calculator.subtract(operand1: "3.516251", and: "1.5484")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithLargeOperand2ShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "-16.1812"
        let actual = calculator.subtract(operand1: "8.645", and: "24.8262")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithValidOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "1512"
        let actual = calculator.multiply(operand1: "54", with: "28")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithValidDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "108.475"
        let actual = calculator.multiply(operand1: "2.592", with: "41.85")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithInvalidOperandsShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.multiply(operand1: "12", with: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithZeroAsOperandShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "0"
        let actual = calculator.multiply(operand1: "4.506", with: "0")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithNegativeOperandShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "-169.78"
        let actual = calculator.multiply(operand1: "-32.65", with: "5.20")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithValidOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "14"
        let actual = calculator.divide(operand1: "56", by: "4")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithValidDecimalOperandsShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "18.1635"
        let actual = calculator.divide(operand1: "96.63", by: "5.32")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithInvalidOperandsShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.divide(operand1: "6", by: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithZeroAsOperand1ShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "0"
        let actual = calculator.divide(operand1: "0", by: "42.4")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithZeroAsOperand2ShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.divide(operand1: "32.75", by: "0")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithNegativeOperandShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "-16.325"
        let actual = calculator.divide(operand1: "-32.65", by: "2")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithValidDegreesShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "1"
        let actual = calculator.sineOf(degrees: "90")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithNegativeDegreesShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "-0.0348995"
        let actual = calculator.sineOf(degrees: "-362")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithInvalidDegreesShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.sineOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithLargeNumberShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "0.669131"
        let actual = calculator.sineOf(degrees: "3264519338778")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithValidDegreesShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "1"
        let actual = calculator.cosineOf(degrees: "93600")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithNegativeDegreesShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "0.358368"
        let actual = calculator.cosineOf(degrees: "-651")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithInvalidDegreesShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        let actual = calculator.cosineOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithLargeNumberShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "-0.920506"
        let actual = calculator.cosineOf(degrees: "6592625119957")
        XCTAssertTrue(expected == actual)
    }
    
    func testBitCoinValueOfValidOperandShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "265252"
        calculator.bitValueOf(coin: "23") { (actual) in
            XCTAssertTrue(expected == actual)
        }
    }
    
    func testBitCoinValueOfValidOperandReturnErrorShouldLeaveMessage() throws {
        mockBitCoinService.shouldReturnError(value: true)
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Information unavailable"
        calculator.bitValueOf(coin: "19.09") { (actual) in
            XCTAssertTrue(expected == actual)
        }
    }
    
    func testBitCoinValueOfInvalidOperandShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        calculator.bitValueOf(coin: "Not a number") { (actual) in
            XCTAssertTrue(expected == actual)
        }
    }
    
    func testGetAddressOfValidOperandShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Wall St, New York, NY 10005, USA"
        calculator.addressOf(latitude: "40.706031", longitude: "-74008813") { (actual) in
            XCTAssertTrue(expected == actual)
        }
    }
    
    func testGetAddressOfValidOperandReturnErrorShouldLeaveMessage() throws {
        mockReverseGeocodeService.shouldReturnError(value: true)
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Information unavailable"
        calculator.addressOf(latitude: "40.706031", longitude: "-74008813") { (actual) in
            XCTAssertTrue(expected == actual)
        }
    }
    
    func testGetAddressOfInvalidOperandShouldLeaveMessage() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expected = "Invalid Operation"
        calculator.addressOf(latitude: "40.706031", longitude: "Not a number") { (actual) in
            XCTAssertTrue(expected == actual)
        }
    }
    
    func testFetchRemoteConfigShouldPass() throws {
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expectedCount = 8
        calculator.getAvailableOperations { (actual) in
            XCTAssertTrue(expectedCount == actual.count)
        }
    }
    
    func testFetchRemoteConfigReturnErrorShouldReturnZero() throws {
        mockRemoteConfigService.shouldReturnError(value: true)
        calculator = CalciLibrary(remoteConfig: mockRemoteConfigService,
                                  bitCoinService: mockBitCoinService,
                                  reverseGeocodeService: mockReverseGeocodeService)
        
        let expectedCount = 0
        calculator.getAvailableOperations { (actual) in
            XCTAssertTrue(expectedCount == actual.count)
        }
    }
}

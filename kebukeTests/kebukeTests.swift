//
//  kebukeTests.swift
//  kebukeTests
//
//  Created by Rhys.K on 2023/12/25.
//

import XCTest
@testable import kebuke

final class kebukeTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUpWithError() throws {
        // 初始化要被測試的 View controller
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        viewController = storyboard.instantiateInitialViewController() as? ViewController
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertTrue(viewController! is ViewController, "oh!shit!")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

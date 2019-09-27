import XCTest

import observableTests

var tests = [XCTestCaseEntry]()
tests += observableTests.allTests()
XCTMain(tests)

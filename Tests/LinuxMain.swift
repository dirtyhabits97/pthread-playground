import XCTest

import knittingTests

var tests = [XCTestCaseEntry]()
tests += knittingTests.allTests()
XCTMain(tests)

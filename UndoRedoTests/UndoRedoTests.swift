//
//  UndoRedoTests.swift
//  UndoRedoTests
//
//  Created by holgermayer on 26.05.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import UndoRedo

import UIKit







class UndoRedoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUndoRedoWithAccessorFunctions() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let undoManager = UndoManager()
        
        let demo = Item(undoManager:undoManager)
        demo.setX(2)
        print(demo.getX())
        XCTAssertTrue(demo.getX() == 2)
        XCTAssertTrue(undoManager.canUndo)
        undoManager.undo()
        print(demo.getX())
        XCTAssertTrue(demo.getX() == 1)
        XCTAssertTrue(undoManager.canRedo)
        undoManager.redo()
        XCTAssertTrue(demo.getX() == 2)

        
        print("Done.")
    }
    
    func testUndoRedoWithPropertyAccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let undoManager = UndoManager()
        
        let demo = Item(undoManager:undoManager)
        demo.y = 2
        print(demo.y)
        XCTAssertTrue(demo.y == 2)
        XCTAssertTrue(undoManager.canUndo)
        undoManager.undo()
        print(demo.y)
        XCTAssertTrue(demo.y == 1)
        XCTAssertTrue(undoManager.canRedo)
        undoManager.redo()
        XCTAssertTrue(demo.y == 2)
        
        print("Done.")
    }
    
}

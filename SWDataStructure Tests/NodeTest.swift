//
//  NodeTest.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 8/26/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

import XCTest

class NodeTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testNodeObject() {
		let node: Node<Int> = Node(data:10)
		XCTAssertNotNil(node, "Object Node should be created")
		XCTAssertTrue(node.data == 10, "Node's data should be set")
		XCTAssertFalse(node.data == 20, "Node's data should be correct")
		XCTAssertNil(node.next, "Node's next shoud not be set")
	}
	
	func testNodeData() {
		let node: Node<Int> = Node(data:20)
		XCTAssertTrue(node.data == 20, "Node's data should be set")
		XCTAssertFalse(node.data == 10, "Node's data should be correct")
		XCTAssertFalse(node.data == 0, "Node's data should be correct")
	}
	
	func testNodeNext() {
		let node1 = Node(data:10)
		let node2 = Node(data:20, next:node1)
		XCTAssertNotNil(node1, "Object Node should be created")
		XCTAssertNotNil(node2, "Object Node should be created")
		XCTAssertNotNil(node2.next, "Node's next should be set")
		XCTAssertEqual(node2.next!, node1, "Node's next should be correct")
		XCTAssertNil(node1.next, "Node's next should not be set")
		XCTAssertTrue(node1.data == 10, "Node's data should be set")
		XCTAssertTrue(node2.data == 20, "Node's data should be set")
	}
}

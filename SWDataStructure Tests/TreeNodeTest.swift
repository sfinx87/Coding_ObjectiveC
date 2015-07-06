//
//  TreeNodeTest.swift
//  SWDataStructure
//
//  Created by Alexander Kobylinskyy on 7/6/15.
//  Copyright © 2015 Alex. All rights reserved.
//

import XCTest

class TreeNodeTest: XCTestCase {

	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testNodeObject() {
		let node: TreeNode<Int> = TreeNode(data:10)
		XCTAssertNotNil(node, "Object Node should be created")
		XCTAssertTrue(node.data == 10, "Node's data should be set")
		XCTAssertFalse(node.data == 20, "Node's data should be correct")
		XCTAssertNil(node.left, "Node's left shoud not be set")
		XCTAssertNil(node.right, "Node's left shoud not be set")
	}
	
	func testNodeData() {
		let node: TreeNode<Int> = TreeNode(data:20)
		XCTAssertTrue(node.data == 20, "Node's data should be set")
		XCTAssertFalse(node.data == 10, "Node's data should be correct")
		XCTAssertFalse(node.data == 0, "Node's data should be correct")
	}
	
	func testNodeLeftAndRight() {
		let node1 = TreeNode(data:10, left: nil)
		let node2 = TreeNode(data:20, right: nil)
		let node3 = TreeNode(data:30, left: node1, right: node2)
		XCTAssertNotNil(node1, "Object Node should be created")
		XCTAssertNotNil(node2, "Object Node should be created")
		XCTAssertNotNil(node3, "Object Node should be created")
		XCTAssertNotNil(node3.left, "Node's left should be set")
		XCTAssertEqual(node3.left!, node1, "Node's left should be correct")
		XCTAssertNotNil(node3.right, "Node's right should be set")
		XCTAssertEqual(node3.right!, node2, "Node's right should be correct")
		XCTAssertTrue(node1.data == 10, "Node's data should be set")
		XCTAssertTrue(node2.data == 20, "Node's data should be set")
		XCTAssertTrue(node3.data == 30, "Node's data should be set")
	}

}

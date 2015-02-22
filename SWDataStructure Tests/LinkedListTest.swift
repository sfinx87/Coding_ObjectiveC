//
//  LinkedListTest.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 8/29/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

import XCTest

class LinkedListTest: XCTestCase {
	
	var list: LinkedList<Int>! = nil

    override func setUp() {
		let listHead: Node<Int> = Node(data: 10)
		list = LinkedList(head: listHead)
        super.setUp()
    }
    
    override func tearDown() {
		list = nil
        super.tearDown()
    }
	
	func testListIsEmpty() {
		XCTAssertNotNil(list, "List should be created")
		XCTAssertTrue(list.isEmpty() == false, "List should not be empty")
		if let headNode = list.head {
			list.removeNode(headNode)
			XCTAssertTrue(list.isEmpty() == true, "List should be empty")
		}
		else {
			XCTAssertFalse(1 == 1, "List should not be empty")
		}
		list.insertData(20)
		XCTAssertTrue(list.isEmpty() == false, "List should not be empty")
	}
	
	func testListInsertion() {
		XCTAssertNotNil(list.head, "List head should be set")
		XCTAssertNotNil(list.tail, "List tail should be set")
		let node: Node<Int> = Node(data: 20)
		list.insertNode(node)
		if let headNext = list.head?.next {
			XCTAssertEqual(headNext, node, "Node should be inserted")
		}
		else {
			XCTAssertFalse(1 == 1, "List node has not be inserted")
		}
		if let listTail = list.tail? {
			XCTAssertEqual(node, listTail, "List tail should be correct")
		}
		else {
			XCTAssertFalse(1 == 1, "List tail has not inserted")
		}
		list.insertData(30)
		XCTAssertNotNil(node.next, "Node's next should be set")
		XCTAssertTrue(node.next?.data == 30, "Node should be inserted")
		XCTAssertTrue(list.tail?.data == 30, "List tail should be correct")
		list.insertData(40)
		XCTAssertTrue(node.next?.next?.data == 40, "Node should be inserted")
		XCTAssertTrue(list.tail?.data == 40, "List tail should be correct")
		XCTAssertTrue(list.head?.data == 10, "List head should be correct")
	}
	
	func testListRemoval() {
		let node: Node<Int> = Node(data: 20)
		list.insertNode(node)
		list.insertData(30)
		list.insertData(40)
		list.removeNode(list.head!)
		XCTAssertNotNil(list.head, "List head should not be nil")
		XCTAssertTrue(list.head!.data == 20, "List head should be reassigned")
		list.removeNode(list.tail!)
		XCTAssertNotNil(list.tail, "List tail should not be nil")
		XCTAssertTrue(list.tail!.data == 30, "List tail should be reassigned")
		list.insertData(40)
		list.removeData(30)
		XCTAssertNil(list.findData(30), "List node should be removed")
		list.removeNode(node)
		XCTAssertNotNil(list.head, "List head should not be nil")
		XCTAssertNotNil(list.tail, "List tail should not be nil")
		XCTAssertNil(list.findData(20), "List node should be removed")
		list.removeData(40)
		XCTAssertNil(list.head, "List head should be equal to nil")
		XCTAssertNil(list.tail, "List tail should be equal to nil")
	}
	
	func testListSearch() {
		list.insertData(20)
		list.insertData(30)
		list.insertData(40)
		XCTAssertEqual(list.findData(10)!, list.head!, "Head should be found correctly")
		XCTAssertEqual(list.findData(40)!, list.tail!, "Tail should be found correctly")
		if let node = list.findData(20) {
			XCTAssertTrue(node.data == 20, "List node should be found correctly")
		}
		else {
			XCTAssertFalse(1 == 1, "List node has not found correctly")
		}
	
		XCTAssertNil(list.findData(50), "Non-existent data should not be found")
	}

}

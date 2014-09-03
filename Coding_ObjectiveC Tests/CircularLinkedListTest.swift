//
//  CircularLinkedListTest.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 9/3/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

import XCTest

class CircularLinkedListTest: XCTestCase {
	
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
		XCTAssertEqual(list.head!.next!, list.head!, "List should be circular")
		
		let node: Node<Int> = Node(data: 20)
		if let headNext = list.head?.next {
			XCTAssertEqual(headNext, node, "Node should be inserted")
		}
		else {
			XCTAssertFalse(1 == 1, "List node has not inserted")
		}
		XCTAssertEqual(node, list.tail!, "List tail should be correct")
		XCTAssertEqual(list.tail!.next!, list.head!, "List should be circular")
		list.insertData(30)
		XCTAssertTrue(list.tail!.data == 30, "List tail should be correct")
		XCTAssertTrue(list.head!.data == 10, "List head should be correct")
		XCTAssertEqual(list.tail!.next!, list.head!, "List should be circular")
	}
	
	func testListRemoval() {
		let node: Node<Int> = Node(data: 20)
		list.insertNode(node)
		list.insertData(30)
		list.insertData(40)
		
		list.removeNode(list.head!)
		XCTAssertNotNil(list.head, "List head should not be nil")
		XCTAssertEqual(list.tail!.next!, list.head!, "List should be circular")
		XCTAssertTrue(list.head!.data == 20, "List head should be reassigned")
		list.removeNode(list.tail!)
		XCTAssertNotNil(list.head, "List head should not be nil")
		XCTAssertNotNil(list.tail, "List tail should not be nil")
		XCTAssertTrue(list.tail!.data == 30, "List tail should be reassigned")
		list.removeData(30)
		XCTAssertNil(list.findData(30), "List node should be removed")
		XCTAssertNotNil(list.head, "List head should not be nil")
		XCTAssertNotNil(list.tail, "List tail should not be nil")
		XCTAssertNil(list.findData(20), "List node should be removed")
		list.removeNode(node)
		XCTAssertNil(list.head, "List head should be equal to nil")
		XCTAssertNil(list.tail, "List tail should be equal to nil")
	}
	
	func testListSearch() {
		list.insertData(20)
		list.insertData(30)
		
		XCTAssertEqual(list.findData(10)!, list.head!, "Head should be found correctly")
		XCTAssertTrue(list.findData(20)!.data == 20, "List node should be found correctly")
		XCTAssertEqual(list.findData(30)!, list.tail!, "Tail should be found correctly")
		XCTAssertTrue(list.head!.data == 10, "Tail should have correct data")
		XCTAssertTrue(list.tail!.data == 30, "Tail should have correct data")
		XCTAssertNil(list.findData(50), "Non-existent data should not be found")
	}

}

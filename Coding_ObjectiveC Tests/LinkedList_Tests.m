//
//  LinkedList_Tests.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/22/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LinkedList.h"
#import "Node.h"

@interface LinkedList_Tests : XCTestCase {
	LinkedList *_list;
}

@end

@implementation LinkedList_Tests

- (void)setUp {
	Node *head = [[Node alloc] initWithData:10];
	_list = [[LinkedList alloc] initWithHead:head];
    [super setUp];
}

- (void)tearDown {
	_list = nil;
    [super tearDown];
}

- (void)testLinkedListIsEmpty {
	LinkedList *list1 = [[LinkedList alloc] init];
	XCTAssertNotNil(list1, @"List should be created");
	XCTAssertTrue(list1.isEmpty == YES, @"List should be empty");
	Node *node = [[Node alloc] initWithData:10];
	[list1 insertNode:node];
	XCTAssertFalse(list1.isEmpty == YES, @"List should not be empty");
	[list1 removeNode:node];
	XCTAssertTrue(list1.isEmpty == YES, @"List should be empty");
	LinkedList *list2 = [[LinkedList alloc] initWithHead:node];
	XCTAssertFalse(list2.isEmpty == YES, @"List should not be empty");
}

- (void)testLinkedListInsertion {
	Node *node = [[Node alloc] initWithData:20];
	LinkedList *list = _list;
	XCTAssertNotNil(list.head, @"List head should be set");
	XCTAssertNotNil(list.tail, @"List tail should be set");
	[list insertNode:node];
	XCTAssertEqual(list.head.next, node, "Node should be inserted");
	XCTAssertEqual(node, list.tail, @"List tail should be correct");
	[list insertNodeWithData:30];
	XCTAssertNotNil(node.next, "Node's next should be set");
	XCTAssertTrue(node.next.data == 30, "Node should be inserted");
	XCTAssertTrue(list.tail.data == 30, @"List tail should be correct");
	[list insertNodeWithData:40];
	XCTAssertTrue(node.next.next.data == 40, "Node should be inserted");
	XCTAssertTrue(list.tail.data == 40, @"List tail should be correct");
	XCTAssertTrue(list.head.data == 10, @"List head should be correct");
}

- (void)testLinkedListFind {
	LinkedList *list = _list;
	[self testLinkedListInsertion];
	XCTAssertEqual([list findNodeWithData:10], list.head, @"Head should be found correctly");
	XCTAssertEqual([list findNodeWithData:40], list.tail, @"Tail should be found correctly");
	XCTAssertTrue([list findNodeWithData:20].data == 20, @"List node should be found correctly");
	XCTAssertNil([list findBeforeNodeWithData:10], @"Head has not node before");
	XCTAssertEqual([list findBeforeNodeWithData:20], list.head, @"Head is node before other node");
	XCTAssertTrue([list findBeforeNodeWithData:list.tail.data].data == 30, @"Tail has node before");
	XCTAssertTrue([list findBeforeNodeWithData:30].data == 20, @"Node has other node before");
}

- (void)testLinkedListRemoval {
	LinkedList *list = _list;
	[self testLinkedListInsertion];
	[list removeNode:list.head];
	XCTAssertNotNil(list.head, @"List head should not be nil");
	XCTAssertTrue(list.head.data == 20, @"List head should be reassigned");
	[list removeNode:list.tail];
	XCTAssertNotNil(list.tail, @"List tail should not be nil");
	XCTAssertTrue(list.tail.data == 30, @"List tail should be reassigned");
	[list insertNodeWithData:40];
	[list removeNodeWithData:30];
	XCTAssertNil([list findNodeWithData:30], @"List node should be removed");
	[list removeNodeWithData:20];
	XCTAssertNotNil(list.head, @"List head should not be nil");
	XCTAssertNotNil(list.tail, @"List tail should not be nil");
	XCTAssertNil([list findNodeWithData:20], @"List node should be removed");
	[list removeNodeWithData:40];
	XCTAssertNil(list.head, @"List head should be equal to nil");
	XCTAssertNil(list.tail, @"List tail should be equal to nil");
}

@end

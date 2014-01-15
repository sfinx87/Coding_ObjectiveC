//
//  CircularLinkedList_Tests.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 1/15/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CircularLinkedList.h"
#import "Node.h"

@interface CircularLinkedList_Tests : XCTestCase {
	CircularLinkedList *_list;
}

@end

@implementation CircularLinkedList_Tests

- (void)setUp {
    Node *head = [[Node alloc] initWithData:10];
	_list = [[CircularLinkedList alloc] initWithHead:head];
	[super setUp];
}

- (void)tearDown
{
    _list = nil;
    [super tearDown];
}

- (void)testLinkedListIsEmpty {
	CircularLinkedList *list1 = [[CircularLinkedList alloc] init];
	XCTAssertNotNil(list1, @"List should be created");
	XCTAssertTrue(list1.isEmpty == YES, @"List should be empty");
	Node *node = [[Node alloc] initWithData:10];
	[list1 insertNode:node];
	XCTAssertFalse(list1.isEmpty == YES, @"List should not be empty");
	[list1 removeNode:node];
	XCTAssertTrue(list1.isEmpty == YES, @"List should be empty");
	CircularLinkedList *list2 = [[CircularLinkedList alloc] initWithHead:node];
	XCTAssertFalse(list2.isEmpty == YES, @"List should not be empty");
}

- (void)testLinkedListInsertion {
	Node *node = [[Node alloc] initWithData:20];
	CircularLinkedList *list = _list;
	XCTAssertNotNil(list.head, @"List head should be set");
	XCTAssertNotNil(list.tail, @"List tail should be set");
	XCTAssertEqual(list.head.next, list.head, "List should be circular");
	[list insertNode:node];
	XCTAssertEqual(list.head.next, node, "Node should be inserted");
	XCTAssertEqual(node, list.tail, @"List tail should be correct");
	XCTAssertEqual(list.tail.next, list.head, "List should be circular");
	[list insertNodeWithData:30];
	XCTAssertTrue(list.tail.data == 30, @"List tail should be correct");
	XCTAssertTrue(list.head.data == 10, @"List head should be correct");
	XCTAssertEqual(list.tail.next, list.head, "List should be circular");
}

- (void)testLinkedListFind {
	CircularLinkedList *list = _list;
	[self testLinkedListInsertion];
	XCTAssertEqual([list findNodeWithData:10], list.head, @"Head should be found correctly");
	XCTAssertTrue([list findNodeWithData:20].data == 20, @"List node should be found correctly");
	XCTAssertEqual([list findNodeWithData:30], list.tail, @"Tail should be found correctly");
	XCTAssertTrue([list findBeforeNodeWithData:10].data == 30, @"Head has tail before");
	XCTAssertEqual([list findBeforeNodeWithData:20], list.head, @"Head is node before other node");
	XCTAssertTrue([list findBeforeNodeWithData:list.tail.data].data == 20, @"Tail has node before");
}

- (void)testLinkedListRemoval {
	CircularLinkedList *list = _list;
	[self testLinkedListInsertion];
	[list removeNode:list.head];
	XCTAssertNotNil(list.head, @"List head should not be nil");
	XCTAssertEqual(list.tail.next, list.head, "List should be circular");
	XCTAssertTrue(list.head.data == 20, @"List head should be reassigned");
	[list removeNode:list.tail];
	XCTAssertNotNil(list.head, @"List head should not be nil");
	XCTAssertNotNil(list.tail, @"List tail should not be nil");
	XCTAssertEqual(list.tail.next, list.head, "List should be circular");
	XCTAssertTrue(list.tail.data == 20, @"List tail should be reassigned");
	[list insertNodeWithData:40];
	[list removeNodeWithData:20];
	XCTAssertNil([list findNodeWithData:20], @"List node should be removed");
	[list removeNodeWithData:40];
	XCTAssertNil(list.head, @"List head should be nil");
	XCTAssertNil(list.tail, @"List tail should not be nil");
}

@end
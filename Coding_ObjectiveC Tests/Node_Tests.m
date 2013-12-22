//
//  Node_Tests.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/22/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Node.h"

@interface Node_Tests : XCTestCase

@end

@implementation Node_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testNodeObject {
	Node *node = [[Node alloc] initWithData:10];
	XCTAssertNotNil(node, @"Object Node should be created");
	XCTAssertTrue(node.data == 10, "Node's data should be set");
	XCTAssertFalse(node.data == 20, "Node's data should be correct");
	XCTAssertNil(node.next, @"Node's next shoud not be set");
}

- (void)testNodeData {
	Node *node = [[Node alloc] initWithData:20 andNext:nil];
	XCTAssertTrue(node.data == 20, "Node's data should be set");
	XCTAssertFalse(node.data == 10, "Node's data should be correct");
	XCTAssertFalse(node.data == 0, "Node's data should be correct");
}

- (void)testNodeNext {
	Node *node1 = [[Node alloc] initWithData:10];
	Node *node2 = [[Node alloc] initWithData:20 andNext:node1];
	XCTAssertNotNil(node1, @"Object Node should be created");
	XCTAssertNotNil(node2, @"Object Node should be created");
	XCTAssertNotNil(node2.next, "Node's next should be set");
	XCTAssertEqual(node2.next, node1, "Node's next should be correct");
	XCTAssertNil(node1.next, @"Node's next should not be set");
	XCTAssertTrue(node1.data == 10, "Node's data should be set");
	XCTAssertTrue(node2.data == 20, "Node's data should be set");
}

- (void)testNodeNextWithoutData {
	Node *node1 = [[Node alloc] initWithData:10];
	Node *node2 = [[Node alloc] initWithNext:node1];
	XCTAssertNotNil(node1, @"Object Node should be created");
	XCTAssertNotNil(node2, @"Object Node should be created");
	XCTAssertNotNil(node2.next, "Node's next should be set");
	XCTAssertEqual(node2.next, node1, "Node's next should be correct");
	XCTAssertNil(node1.next, @"Node's next should not be set");
	XCTAssertTrue(node1.data == 10, "Node's data should be set");
	XCTAssertTrue(node2.data == 0, "Node's data should not be set");
}

@end

//
//  CircularLinkedList.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 1/2/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "CircularLinkedList.h"
#import "Node.h"

@implementation CircularLinkedList

@synthesize head = _head;
@synthesize tail = _tail;

- (void)insertNode:(Node *)node {
	if (!_head) {
		_head = node;
		_tail = _head;
	}
	else {
		_tail = node;
	}
	_tail.next = _head;
}

- (Node *)findNodeWithData:(NSInteger)data {
	Node *resultNode = nil;
	for (Node *node = _head; node != nil; node = node.next) {
		if (node.data == data) {
			resultNode = node;
			break;
		}
		if (node == _head) {
			break;
		}
	}
	return resultNode;
}

- (Node *)findBeforeNodeWithData:(NSInteger)data {
	Node *resultNode = nil;
	for (Node *node = _head; node != nil; node = node.next) {
		if (node.next.data == data) {
			resultNode = node;
			break;
		}
		if (node.next == _head) {
			break;
		}
	}
	return resultNode;
}

@end

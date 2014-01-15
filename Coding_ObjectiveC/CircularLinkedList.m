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

#pragma mark - ListProtocol

- (void)insertNode:(Node *)node {
	if (!_head) {
		_head = node;
		_tail = _head;
	}
	else {
		_tail.next = node;
		_tail = _tail.next;
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
		if (node.next == _head) {
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

- (void)removeNodeWithData:(NSInteger)data {
	if (data == _head.data) {
		Node *resultNode = _head;
		if (_head.next == _head) {
			_head = nil;
		}
		else
		{
			_head =  _head.next;
			_tail.next = _head;
		}
		if (resultNode == _tail) {
			_tail = nil;
		}
		resultNode = nil;
		return;
	}
	Node *node = [self findBeforeNodeWithData:data];
	if (node) {
		Node *resultNode = node.next;
		node.next = node.next.next;
		if (_tail == resultNode) {
			_tail = node;
		}
		resultNode = nil;
	}
}

#pragma mark - Description

- (NSString *)description {
	NSMutableString *description = [NSMutableString string];
	Node *node = _head;
    while (node) {
		[description appendFormat:@"%@ ", node.description];
        node = node.next;
		if (node == _head) {
			break;
		}
    }
	return [description copy];
}

@end

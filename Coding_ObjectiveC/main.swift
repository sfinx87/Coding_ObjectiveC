//
//  main.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

var first: Node<Int> = Node<Int>(data: 1)
var second: Node<Int> = Node<Int>(data: 2, nextNode: first)
var third: Node<Int> = Node<Int>(data: 3, nextNode: second)
println(first)
println(third)

/*#import "LinkedList.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Node *head = [[Node alloc] initWithData:10];
		LinkedList *list = [[LinkedList alloc] initWithHead:head];
		[list insertNodeWithData:20];
		Node *otherNode = [[Node alloc] initWithData:30];
		[list insertNode:otherNode];
		[list removeNodeWithData:30];
		[list insertNodeWithData:40];
		NSLog(@"List:%@", list);
	}
    return 0;
}*/


//
//  main.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"

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
}


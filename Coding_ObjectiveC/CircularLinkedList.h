//
//  CircularLinkedList.h
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 1/2/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "LinkedList.h"
@class Node;

@interface CircularLinkedList : LinkedList

@property (nonatomic, strong) Node *head;
@property (nonatomic, strong) Node *tail;

- (void)insertNode:(Node *)node;
- (void)removeNodeWithData:(NSInteger)data;
- (Node *)findNodeWithData:(NSInteger)data;
- (Node *)findBeforeNodeWithData:(NSInteger)data;

@end

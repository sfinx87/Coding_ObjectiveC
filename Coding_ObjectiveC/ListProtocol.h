//
//  ListProtocol.h
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

@class List;
@class Node;

@protocol LinkedListProtocol <NSObject>

@property (nonatomic, strong) Node *head;
@property (nonatomic, strong) Node *tail;

- (BOOL)isEmpty;
- (void)insertNode:(Node *)node;
- (void)removeNode:(Node *)node;
- (void)insertNodeWithData:(NSInteger)data;
- (void)removeNodeWithData:(NSInteger)data;
- (Node *)findNodeWithData:(NSInteger)data;

@end

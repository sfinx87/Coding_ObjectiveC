//
//  List.h
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ListProtocol.h"
@class Node;

@interface List : NSObject <ListProtocol>

@property (nonatomic, strong) Node *head;
@property (nonatomic, strong) Node *tail;

- (id)initWithHead:(Node *)head;

- (BOOL)isEmpty;
- (void)insertNode:(Node *)node;
- (void)removeNode:(Node *)node;
- (void)insertNodeWithData:(NSInteger)data;
- (void)removeNodeWithData:(NSInteger)data;
- (Node *)findNodeWithData:(NSInteger)data;
- (Node *)findBeforeNodeWithData:(NSInteger)data;

@end

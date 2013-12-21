//
//  NodeProtocol.h
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

@class Node;

@protocol NodeProtocol <NSObject>

@property (nonatomic, unsafe_unretained) NSInteger data;
@property (nonatomic, strong) Node *next;

@end

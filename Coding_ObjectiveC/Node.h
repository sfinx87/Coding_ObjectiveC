//
//  Node.h
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "NodeProtocol.h"

@interface Node : NSObject <NodeProtocol>

@property (nonatomic, unsafe_unretained) NSInteger data;
@property (nonatomic, strong) Node *next;

- (id)initWithData:(NSInteger)data andNext:(Node *)next;
- (id)initWithData:(NSInteger)data;
- (id)initWithNext:(Node *)next;

@end

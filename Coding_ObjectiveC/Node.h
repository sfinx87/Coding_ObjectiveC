//
//  Node.h
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, unsafe_unretained) NSInteger data;
@property (nonatomic, strong) Node *next;

- (id)initWithData:(NSInteger)data andNextNode:(Node *)next;
- (id)initWithData:(NSInteger)data;
- (id)initWithNextNode:(Node *)next;

@end

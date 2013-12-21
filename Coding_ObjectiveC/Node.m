//
//  Node.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Node.h"

@implementation Node

#pragma mark - Initialization

- (id)initWithData:(NSInteger)data andNextNode:(Node *)next {
	self = [super init];
	if (self) {
		_data = data;
		_next = next;
	}
	return self;
}

- (id)initWithData:(NSInteger)data {
	self = [self initWithData:data andNextNode:nil];
	if (self) {
	}
	return self;
}

- (id)initWithNextNode:(Node *)next {
	self = [self initWithData:0 andNextNode:next];
	if (self) {
	}
	return self;
}

#pragma mark - Description

- (NSString *)description {
	NSString *description = [NSString stringWithFormat:@"%li", (long)_data];
	return description;
}

- (NSString *)debugDescription {
	NSString *description = [NSString stringWithFormat:@"data:%li next:%@", (long)_data, _next ? @"is present" : @"is not present"];
	return description;
}

@end

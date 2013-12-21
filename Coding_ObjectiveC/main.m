//
//  main.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Node *a = [[Node alloc] initWithData:10];
		Node *b = [[Node alloc] initWithData:20 andNextNode:a];
		NSLog(@"A:%@", a);
		NSLog(@"B:%@", b);
	}
    return 0;
}


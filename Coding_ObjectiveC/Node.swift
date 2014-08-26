//
//  Node.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 8/24/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

import Foundation

class Node<T>: Printable {
	typealias Element = T
	var data: T!
	var nextNode: Node<T>? = nil
	
	init(data: T, nextNode: Node<T>? = nil) {
		self.data = data
		self.nextNode = nextNode
	}
	
	var description: String {
		return "Node:\(data) next:\(nextNode)"
	}
}

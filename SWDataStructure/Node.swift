//
//  Node.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 8/24/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

class Node<T: Equatable>: CustomStringConvertible, Equatable {
	var data: T
	var next: Node<T>? = nil
	
	init(data: T, next: Node<T>? = nil) {
		self.data = data
		self.next = next
	}
	
	var description: String {
		return "\(data)"
	}
}

func == <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
	return lhs.data == rhs.data
}

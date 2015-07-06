//
//  TreeNode.swift
//  SWDataStructure
//
//  Created by Alexander Kobylinskyy on 7/6/15.
//  Copyright © 2015 Alex. All rights reserved.
//

class TreeNode<T: Equatable>: CustomStringConvertible, Equatable {
	var data: T
	var left: TreeNode<T>? = nil
	var right: TreeNode<T>? = nil
	
	init(data: T, left: TreeNode<T>? = nil, right: TreeNode<T>? = nil) {
		self.data = data
		self.left = left
		self.right = right
	}
	
	var description: String {
		return "\(data) Left:\(left?.data) Right:\(right?.data)"
	}
}

func == <T>(lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
	return lhs.data == rhs.data
}

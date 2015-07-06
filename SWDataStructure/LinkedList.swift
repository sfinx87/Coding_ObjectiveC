//
//  LinkedList.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 8/29/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

class LinkedList<T: Equatable> : CustomStringConvertible/*, CollectionType*/ {
	var head: Node<T>? = nil
	var tail: Node<T>? {
		get {
			var node = head
			while let _ = node?.next {
				node = node?.next
			}
			return node
		}
	}
	
	init(head: Node<T>) {
		self.insertNode(head)
	}
	
	var isEmpty: Bool {
		return (head == nil)
	}
	
	var count: Int {
		var count = 0
		for var node: Node<T>? = head; node != nil; node = node?.next {
			count++
		}
		return count
	}
	
	func insertNode(node: Node<T>) {
		if let _ = self.tail {
			self.tail?.next = node
		}
		else {
			head = node
		}
	}
	
	func removeNode(node: Node<T>) {
		var prevNode: Node<T>? = nil
		for var listNode: Node<T>? = head; listNode != nil; prevNode = listNode, listNode = listNode?.next {
			if node == listNode {
				if (node == head) {
					head = head?.next
				}
				else {
					prevNode?.next = prevNode?.next?.next
				}
				listNode = nil
				break
			}
		}
	}
	
	func insertData(data: T) {
		let node: Node<T> = Node(data: data)
		self.insertNode(node)
	}
	
	func removeData(data: T) {
		let node: Node<T>? = self.findData(data)
		if let resultNode = node {
			self.removeNode(resultNode)
		}
	}
	
	func findData(data: T) -> Node<T>? {
		var result: Node<T>? = nil
		for var node: Node<T>? = head; node != nil; node = node?.next {
			if node?.data == data {
				result = node
				break
			}
		}
		return result
	}
	
	func reverse() {
		guard head != nil else {
			return
		}
		var prevNode: Node<T>? = nil
		while let _ = head {
			let tempNode: Node<T>? = head?.next
			head?.next = prevNode
			prevNode = head
			head = tempNode
		}
		head = prevNode
	}
	
	var description: String {
		var result: String = ""
		for var node: Node<T>? = head; node != nil; node = node?.next {
			result += "\(node)"
			result += " "
		}
		return result
	}
}

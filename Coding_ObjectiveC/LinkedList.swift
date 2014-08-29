//
//  LinkedList.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 8/29/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

class LinkedList<T: Equatable> : Printable {
	var head: Node<T>? = nil
	var tail: Node<T>? = nil
	
	init(head: Node<T>) {
		self.insertNode(head)
	}
	
	func isEmpty() -> Bool {
		return (head == nil);
	}
	
	func insertNode(node: Node<T>) {
		if let headNode = head {
			tail?.next = node
			tail = tail?.next
		}
		else {
			head = node
			tail = head
		}
	}
	
	func removeNode(node: Node<T>) {
		var prevNode: Node<T>? = nil
		for var listNode: Node<T>? = head; listNode != nil; prevNode = listNode, listNode = listNode?.next {
			if node == listNode {
				if let previousNode = prevNode {
					previousNode.next = previousNode.next?.next
				}
				else {
					head = head?.next
				}
				if (tail == listNode) {
					tail = prevNode
				}
				listNode = nil
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
		return result;
	}
	
	var description: String {
		var result: String = ""
		for var node: Node<T>? = head; node != nil; node = node?.next {
			result += "\(node)"
		}
		return ""
	}
}

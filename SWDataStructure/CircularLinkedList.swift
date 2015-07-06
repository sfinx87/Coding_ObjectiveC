//
//  CircularLinkedList.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 9/3/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

class CircularLinkedList<T: Equatable>: LinkedList<T> {
	
	override var tail: Node<T>? {
		get {
			var node = head
			while let _ = node?.next {
				if (node?.next == head) {
					break
				}
				node = node?.next
			}
			return node
		}
	}
	
	override init(head: Node<T>) {
		super.init(head: head)
	}
	
	override var count: Int {
		var count = 0
		for var node: Node<T>? = head; node != nil; node = node?.next {
			count++
			if node?.next == head {
				break
			}
		}
		return count
	}
	
	override func insertNode(node: Node<T>) {
		let tailNode = self.tail
		if let _ = tailNode {
			tailNode!.next = node
			node.next = head
		}
		else {
			head = node
			head?.next = head
		}
	}
	
	override func removeNode(node: Node<T>) {
		var prevNode: Node<T>? = nil
		let tailNode = self.tail
		for var listNode: Node<T>? = head; listNode != nil; prevNode = listNode, listNode = listNode?.next {
			if node == listNode {
				if (node == head) {
					if (head?.next == head) {
						head = nil
					}
					else {
						head = head?.next
						tailNode?.next = head
					}
				}
				else {
					prevNode?.next = prevNode?.next?.next
				}
				listNode = nil
				break
			}
		}
	}
	
	override func findData(data: T) -> Node<T>? {
		var result: Node<T>? = nil
		for var node: Node<T>? = head; node != nil; node = node?.next {
			if node?.data == data {
				result = node
				break
			}
			if node?.next == head {
				break
			}
		}
		return result
	}
	
	override func reverse() {
	}
	
	override var description: String {
		var result: String = ""
		for var node: Node<T>? = head; node != nil; node = node?.next {
			result += "\(node)"
			result += " "
			if node?.next == head {
				break
			}
		}
		return result
	}
	
}

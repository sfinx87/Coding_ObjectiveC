//
//  CircularLinkedList.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 9/3/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

class CircularLinkedList<T: Equatable>: LinkedList<T> {
	
	override init(head: Node<T>) {
		super.init(head: head)
	}
	
	override func insertNode(node: Node<T>) {
		if let _ = head {
			tail?.next = node
			tail = tail?.next
		}
		else {
			head = node
			tail = head
		}
		tail?.next = head
	}
	
	override func removeNode(node: Node<T>) {
		var prevNode: Node<T>? = nil
		for var listNode: Node<T>? = head; listNode != nil; prevNode = listNode, listNode = listNode?.next {
			if node == listNode {
				if let previousNode = prevNode {
					previousNode.next = previousNode.next?.next
				}
				else {
					if head == tail {
						head = nil
						tail = nil
					}
					else {
						head = head?.next
						tail?.next = head
					}
				}
				listNode = nil
				break
			}
		}
	}
	
	override func insertData(data: T) {
		let node: Node<T> = Node(data: data)
		self.insertNode(node)
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
		return result;
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

//
//  main.swift
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

let listHead = Node(data: "a")
print("\(listHead)")
let list = LinkedList(head: listHead)
list.insertData("b")
list.insertData("c")
list.reverse()
print("List:\(list)")
let circularList = CircularLinkedList(head: listHead)
circularList.insertData("b")
circularList.insertData("c")
print("Circular list:\(circularList)")

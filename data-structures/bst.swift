//
//  binary-search-tree.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/20/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

class BSTNode{
    var data : Double
    var left : BSTNode?
    var right : BSTNode?
    var height : Int {
        return self.getHeight()
    }
    var heightDifference : Int {
        return self.getHeight(root: self.left) - self.getHeight(root: self.right)
    }
    
    init(data: Double){
        self.data = data
    }
    
    func getHeight() -> Int{
        return getHeight(root: self)
    }
    private func getHeight(root: BSTNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(getHeight(root: root?.left), getHeight(root: root?.right))
    }
    
    private func rightRotation(_ parent: BSTNode?) -> BSTNode?{
        // Performs a right rotation
        guard let temp : BSTNode = parent?.left else { return nil }
        parent?.left = temp.right
        temp.right = parent
        return temp
    }
    
    private func leftRotation(_ parent: BSTNode?) -> BSTNode?{
        //Performs a left rotation
        guard let temp : BSTNode = parent?.right else { return nil }
        parent?.right = temp.left
        temp.left = parent
        return temp
    }
    
    private func leftRightRotation(_ parent: BSTNode?) -> BSTNode?{
        // Performs a single leftRotation, and then a single rightRotation.
        guard let temp : BSTNode = parent?.left else { return nil }
        parent?.left = leftRotation(temp)
        return rightRotation(parent)
    }
    
    private func rightLeftRotation(_ parent: BSTNode?) -> BSTNode?{
        // Performs a single rightRotation, and then a single leftRotation.
        guard let temp : BSTNode = parent?.right else { return nil }
        parent?.right = rightRotation(temp)
        return leftRotation(parent)
    }
    
    func balance(temp: BSTNode?) -> BSTNode?{
        guard let balanceFactor : Int = temp?.heightDifference else { return nil }
        var newTemp : BSTNode? = temp
        if balanceFactor > 1 {
            if let val : Int = temp?.left?.heightDifference, val > 0 {
                newTemp = rightRotation(temp)
            } else {
                newTemp = leftRightRotation(temp)
            }
        } else if balanceFactor < -1 {
            if let val : Int = temp?.right?.heightDifference, val > 0 {
                newTemp = rightLeftRotation(temp)
            } else {
                newTemp = leftRotation(temp)
            }
        }
        return newTemp
    }
    
}


class BST<Element: Comparable>{
    fileprivate var root : BSTNode?
    var length : Int = 0
    var isEmpty : Bool {
        return length == 0
    }
}


extension BST{
    func insert(data: Double){
        self.length += 1
        self.root = insert(root: self.root, data: data)
    }
    
    fileprivate func insert(root: BSTNode?, data: Double) -> BSTNode?{
        if root == nil {
            return BSTNode(data: data)
        }
        if let rootVal : Double = root?.data, data < rootVal {
            root?.left = insert(root: root?.left, data: data)
        } else if let rootVal : Double = root?.data, data > rootVal {
            root?.right = insert(root: root?.right, data: data)
        }
        
        return root
    }
    
    func search(data: Double) -> Bool {
        return search(root: self.root, data: data)
    }
    
    fileprivate func search(root: BSTNode?, data: Double) -> Bool {
        if root == nil {
            return false
        }
        if let rootVal : Double = root?.data, data < rootVal {
            return search(root: root?.left, data: data)
        } else if let rootVal : Double = root?.data, data > rootVal {
            return search(root: root?.right, data: data)
        } else {
            return root!.data == data
        }
    }
    
    fileprivate func search(forData data: Double) -> (BSTNode?, BSTNode?)?{
        if self.search(data: data){
            var current : BSTNode? = self.root
            var parent : BSTNode?
            while current != nil {
                if let currVal : Double = current?.data {
                    if data < currVal {
                        parent = current
                        current = current?.left
                    } else if data > currVal {
                        parent = current
                        current = current?.right
                    } else {
                        break
                    }
                }
            }
            return (parent, current)
        }
        return nil
    }
    
    func inorderTraversal(operation: (Any)->() ){
        inorderTraversal(root: self.root, operation: operation)
    }
    
    fileprivate func inorderTraversal(root: BSTNode?, operation: (Any)->()){
        if let rootVal = root?.data, root != nil {
            inorderTraversal(root: root?.left, operation: operation)
            operation(rootVal)
            inorderTraversal(root: root?.right, operation: operation)
        }
    }
    
    func preorderTraversal(operation: (Any)->() ){
        preorderTraversal(root: self.root, operation: operation)
    }
    
    fileprivate func preorderTraversal(root: BSTNode?, operation: (Any)->()){
        if let rootVal = root?.data, root != nil {
            operation(rootVal)
            preorderTraversal(root: root?.left, operation: operation)
            preorderTraversal(root: root?.right, operation: operation)
        }
    }
    
    func postorderTraversal(operation: (Any)->() ){
        preorderTraversal(root: self.root, operation: operation)
    }
    
    fileprivate func postorderTraversal(root: BSTNode?, operation: (Any)->()){
        if let rootVal = root?.data, root != nil {
            postorderTraversal(root: root?.left, operation: operation)
            postorderTraversal(root: root?.right, operation: operation)
            operation(rootVal)
        }
    }
    
}



extension BST {
    convenience init(collection: [Double]) {
        self.init()
        for element in collection{
            self.insert(data: element)
        }
    }
}



extension BST {
    //Remove method and its helpers.
    func remove(data: Double) {
        guard let (nodeToRemove, parent) = search(forData: data) else { return }
        //Checks if the nodeToRemove has children, if it doesn't the helper method 
        //will remove the node
        if nodeToRemove?.left == nil && nodeToRemove?.right == nil {
            remove(nodeWithZeroChildren: nodeToRemove, parent: parent)
            return
        }
        
        if nodeToRemove?.left != nil && nodeToRemove?.right != nil {
            remove(nodeWithBothChildren: BSTNode?)
        }
        
        
    }
    
    fileprivate func remove(nodeWithZeroChildren node: BSTNode?, parent: BSTNode?){
        //The helper is responsible for removing a node if it has 0 children.
        let parent = parent
        if parent?.left === node {
            parent?.left = nil
        } else {
            parent?.right = nil
        }
        
        self.length -= 1
    }
}

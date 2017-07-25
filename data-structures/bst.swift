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
        return getHeight()
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
        print("root: \(root?.data)")
        if root == nil {
            return 0
        }
        return 1 + max(getHeight(root: root?.left), getHeight(root: root?.right))
    }
    
    private func rightRotation(_ parent: BSTNode?) -> BSTNode?{
        // Performs a right rotation
        print("rightRotation()")
        guard let temp : BSTNode = parent?.left else { return nil }
        parent?.left = temp.right
        temp.right = parent
        return temp
    }
    
    private func leftRotation(_ parent: BSTNode?) -> BSTNode?{
        //Performs a left rotation
        print("leftRotation()")
        guard let temp : BSTNode = parent?.right else { return nil }
        parent?.right = temp.left
        temp.left = parent
        return temp
    }
    
    private func leftRightRotation(_ parent: BSTNode?) -> BSTNode?{
        // Performs a single leftRotation, and then a single rightRotation.
        print("leftRightRotation()")
        guard let temp : BSTNode = parent?.left else { return nil }
        parent?.left = leftRotation(temp)
        return rightRotation(parent)
    }
    
    private func rightLeftRotation(_ parent: BSTNode?) -> BSTNode?{
        // Performs a single rightRotation, and then a single leftRotation.
        print("rightLeftRotation()")
        guard let temp : BSTNode = parent?.right else { return nil }
        parent?.right = rightRotation(temp)
        return leftRotation(parent)
    }
    
    func balance(temp: BSTNode?) -> BSTNode?{
        guard let balanceFactor : Int = temp?.heightDifference else { return nil }
        print("The balance factor: \(balanceFactor)")
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
    var length : Int = 0 {
        didSet {
            print(oldValue)
        }
    }
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
    
    func inorderTraversal(){
        inorderTraversal(root: self.root)
    }
    
    fileprivate func inorderTraversal(root: BSTNode?){
        if let rootVal = root?.data, root != nil {
            inorderTraversal(root: root?.left)
            print(rootVal)
            inorderTraversal(root: root?.right)
        }
    }
    
    func preorderTraversal(){
        preorderTraversal(root: self.root)
    }
    
    fileprivate func preorderTraversal(root: BSTNode?){
        if let rootVal = root?.data, root != nil {
            print(rootVal)
            preorderTraversal(root: root?.left)
            preorderTraversal(root: root?.right)
        }
    }
    
    func postorderTraversal(){
        postorderTraversal(root: self.root)
    }
    
    fileprivate func postorderTraversal(root: BSTNode?){
        if let rootVal = root?.data, root != nil {
            postorderTraversal(root: root?.left)
            postorderTraversal(root: root?.right)
            print(rootVal)
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
        guard var (nodeToRemove, parent) = search(forData: data) else { return }
        //Checks if the nodeToRemove has children, if it doesn't the helper method 
        //will remove the node
        if nodeToRemove?.left == nil && nodeToRemove?.right == nil {
            remove(nodeWithZeroChildren: nodeToRemove, parent: parent)
            self.length -= 1
            return
        }
        
        if nodeToRemove?.left != nil && nodeToRemove?.right != nil {
            remove(nodeWithBothChildren: nodeToRemove)
            self.length -= 1
            return
        }
        
        remove(nodeWithOneChild: nodeToRemove, parent: parent)
        self.length -= 1
        
    }
    
    fileprivate func remove(nodeWithOneChild node: BSTNode?, parent: BSTNode?){
        var parent = parent
        if node?.right == nil {
            //If true, the node has a left child
            if node?.left != nil {
                if node === self.root {
                    self.root = self.root?.left
                    self.root =  self.root?.balance(temp: self.root)
                    return
                }
                
                if parent?.left === node {
                    parent?.left = node?.left
                    return
                } else {
                    parent?.right = node?.right
                    return
                }
            }
        } else {
            //the node has a right child
            if node?.right != nil {
                if node === self.root {
                    self.root = self.root?.right
                    self.root =  self.root?.balance(temp: self.root)
                    return
                }
                
                if parent?.left === node {
                    parent?.left = node?.right
                    return
                } else {
                    parent?.right = node?.right
                    return
                }
            }
        }
    }
    fileprivate func remove(nodeWithBothChildren node: BSTNode?){
        var node = node
        if node === self.root {
            //Check if left subtree has right subtree 
            if node?.left?.right == nil {
                guard let data : Double = node?.left?.data else { return }
                node?.data = data
                node?.left = node?.left?.left
                return
            }
            //Check if right subtree has left subtree
            if node?.right?.left == nil {
                guard let data : Double = node?.right?.data else { return }
                node?.data = data
                node?.right = node?.right?.right
                return
            }
            
            var maxInLeft : BSTNode? = node?.left
            var shadowTheMaxInLeft : BSTNode?
            while maxInLeft?.right != nil {
                shadowTheMaxInLeft = maxInLeft
                maxInLeft = maxInLeft?.right
            }
            //Overwrite the data in node with data from maxInLeft
            node?.data = maxInLeft!.data
            shadowTheMaxInLeft?.right = nil
            return
        }
        
        //Check if left subtree has right subtree
        if node?.left?.right == nil {
            guard let data : Double = node?.left?.data else { return }
            node?.data = data
            node?.left = node?.left?.left
            return
        }
        //Check if right subtree has left subtree
        if node?.right?.left == nil {
            guard let data : Double = node?.right?.data else { return }
            node?.data = data
            node?.right = node?.right?.right
            return
        }
        //Replace the node to remove with the min value in the right subtree
        var replacement : BSTNode? = node?.right
        var shadowReplacement : BSTNode?
        
        while replacement?.left != nil {
            shadowReplacement = replacement
            replacement = replacement?.left
        }
        
        //Overwrite the data in node from data in replacement
        node?.data = replacement!.data
        
        //remove the duplicate
        shadowReplacement?.left = nil
        
        
        
    }
    
    fileprivate func remove(nodeWithZeroChildren node: BSTNode?, parent: BSTNode?){
        //The helper is responsible for removing a node if it has 0 children.
        let parent = parent
        if parent?.left === node {
            parent?.left = nil
        } else {
            parent?.right = nil
        }
        
    }
}

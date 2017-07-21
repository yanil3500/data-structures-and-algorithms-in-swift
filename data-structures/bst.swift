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
    var nodes : Int = 0 
}


extension BST{
    func insert(data: Double){
        self.nodes += 1
        self.root = insert(root: self.root, data: data)
    }
    
    private func insert(root: BSTNode?, data: Double) -> BSTNode?{
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
}

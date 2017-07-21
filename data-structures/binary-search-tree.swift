//
//  binary-search-tree.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/20/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

class BSTNode<Element>{
    var data : Element
    var left : BSTNode<Element>?
    var right : BSTNode<Element>?
    var height : Int {
        return self.getHeight()
    }
    var heightDifference : Int {
        return self.getHeight(root: self.left) - self.getHeight(root: self.right)
    }
    
    init(data: Element){
        self.data = data
    }
    
    func getHeight() -> Int{
        return getHeight(root: self)
    }
    private func getHeight(root: BSTNode<Element>?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(getHeight(root: root?.left), getHeight(root: root?.right))
    }
    
    private func rightRotation(_ parent: BSTNode<Element>?) -> BSTNode<Element>?{
        // Performs a right rotation
        let temp : BSTNode<Element>? = parent?.left
        parent?.left = temp?.right
        temp?.right = parent
        return temp
    }
    
    private func leftRotation(_ parent: BSTNode<Element>?) -> BSTNode<Element>?{
        //Performs a left rotation
        let temp : BSTNode<Element>? = parent?.right
        parent?.right = temp?.left
        temp?.left = parent
        return temp
    }

    private func leftRightRotation(_ parent: BSTNode<Element>?) -> BSTNode<Element>?{
        // Performs a single leftRotation, and then a single rightRotation.
        let temp : BSTNode<Element>? = parent?.left
        parent?.left = leftRotation(temp)
        return rightRotation(parent)
    }
    
    private func rightLeftRotation(_ parent: BSTNode<Element>?) -> BSTNode<Element>?{
        // Performs a single rightRotation, and then a single leftRotation.
        let temp : BSTNode<Element>? = parent?.right
        parent?.right = rightRotation(temp)
        return leftRotation(parent)
    }
    
    class func balance(temp: BSTNode<Element>?) -> BSTNode<Element>?{
        guard let balanceFactor : Int = temp?.heightDifference else { return nil }
        var newTemp : BSTNode<Element>? = temp
        if balanceFactor > 1 {
            //The BST is right heavy .
            if let val : Int = temp?.left?.heightDifference, val > 0 {
                newTemp = rightRotation(temp)
            } else {
                newTemp = leftRightRotation(temp)
            }
        } else if balanceFactor < -1 {
            //The BST is left heavy.
            if let val : Int = temp?.right?.heightDifference, val > 0 {
                newTemp =  rightLeftRotation(temp)
            } else {
                newTemp = leftRotation(temp)
            }
        }
        
    }
    
}


class BST<Element>{
    
}

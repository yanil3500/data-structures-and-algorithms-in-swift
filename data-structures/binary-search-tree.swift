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
    private func getHeight(root: BSTNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(getHeight(root: root?.left), getHeight(root: root?.right))
    }
    
    private func rightRotation(parent: BSTNode?) -> BSTNode?{
        // Performs a right rotation
        let temp : BSTNode? = parent?.left
        parent?.left = temp?.right
        temp?.right = parent
        return temp
    }
    
    private func leftRotation(parent: BSTNode?) -> BSTNode?{
        //Performs a left rotation
        let temp : BSTNode? = parent?.right
        parent?.right = temp?.left
        temp?.left = parent
        return temp
    }

    private func leftRightRotation(parent: BSTNode?) -> BSTNode?{
        // Performs a single leftRotation, and then a single rightRotation.
        let temp : BSTNode? = parent?.left
        parent?.left = leftRotation(parent: temp)
        return rightRotation(parent: parent)
    }
    
    private func rightLeftRotation(parent: BSTNode?) -> BSTNode?{
        // Performs a single rightRotation, and then a single leftRotation.
        let temp : BSTNode? = parent?.right
        parent?.right = rightRotation(parent: temp)
        return leftRotation(parent: parent)
    }
    
}

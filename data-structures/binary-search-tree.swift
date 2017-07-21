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
}

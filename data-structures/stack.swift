//
//  stack.swift
//  data-structures
//
//  Created by Elyanil Liranzo Castro on 7/11/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

class Node<Element>{
    /*This will be used as a supporting class for Stack ADT.*/
    var data : Element
    var next : Node?
    init(data: Element){
        self.data = data
    }
}

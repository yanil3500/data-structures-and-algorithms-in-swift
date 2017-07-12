# Data Structures and Algorithms in Swift [![Build Status](https://travis-ci.org/yanil3500/data-structures-and-algorithms-in-swift.svg?branch=master)](https://travis-ci.org/yanil3500/data-structures-and-algorithms-in-swift)
This repo contains Swift implementations of classic data structures and algorithms.

**Stack**
- **Implementation**: `stack.swift`
- **Tests**: `StackTests.swift`
- `A Stack is an ADT (abstract data type) that allows operations at one end only. At any given time, we can only access the last item that was pushed onto the stack. This characteristic makes the stack ADT a Last-In-First-Out, or LIFO data structure; That is, the last item that was placed, or in Stack parlance, 'pushed' onto to the stack is the first one that is accessed, or in Stack parlance, the first item to be 'popped' off the stack.`

-*Stack Operations*:

    push(data: Element) Complexity: O(1)
    pop() -> Element Comeplexity: O(1)
    peek() -> Element Complexity: O(1)
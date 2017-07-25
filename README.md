# Data Structures and Algorithms in Swift [![Build Status](https://travis-ci.org/yanil3500/data-structures-and-algorithms-in-swift.svg?branch=master)](https://travis-ci.org/yanil3500/data-structures-and-algorithms-in-swift)
This repo contains Swift implementations of classic data structures and algorithms.
**Stack**
- **Implementation**: `stack.swift`
- **Tests**: `StackTests.swift`
- Source: [Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)
- A Stack is an ADT (abstract data type) that allows operations at one end only. At any given time, we can only access the last item that was pushed onto the stack. This characteristic makes the stack ADT a Last-In-First-Out, or LIFO data structure; That is, the last item that was placed, or in Stack parlance, 'pushed' onto to the stack is the first one that is accessed, or in Stack parlance, the first item to be 'popped' off the stack.

-*Stack Operations*:

    push(data: Element) Complexity: O(1)
    pop() -> Element Comeplexity: O(1)
    peek() -> Element Complexity: O(1)

**Queue**
- **Implementation**: `queue.swift`
- **Tests**: `QueueTests.swift`
- Source: [Wikipedia](https://en.wikipedia.org/wiki/Queue_(abstract_data_type))
- A Queue is a linear data structure in which the addition of elements takes place on one end and removal of elements takes place on the other.

-*Stack Operations*:

    enqueue(data: Element) Complexity: O(1)
    dequeue() -> Element Comeplexity: O(1)
    peek() -> Element Complexity: O(1)

**Bubble Sort**
- **Implementation**: `SortingExtensionsOnArray.swift`
- **Tests**: `BubbleSortTests.swift`
- Source: [Wikipedia](https://en.wikipedia.org/wiki/Bubble_sort)
- Bubble sort is a sorting algorithm that repeatedly steps through a given collection, comparing each pair of adjacent elements and swapping them if they are in the wrong order.
     The pass through the collection is repeated until no swaps are needed, resulting in the sorted 
     collection.
- Although the algorithms is simple, it is too slow and impractical for most problems.
- Bubble Sort is not a pratical sorting algorithm when n (the number of elements) is large.

-**Time Complexity**:
- Worst Case Performance: O(n<sup>2</sup>) 
- Best Case Performance: O(n)

**Selection Sort**
- **Implementation**: `SortingExtensionsOnArray.swift`
- **Tests**: `SelectionSortTests.swift`
- Source: [Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)
- Selection sort is an in-place comparison-based sorting algorithm.
- Selection sort runs in O(n^2), making it inefficient on a large collection of elements.
- Selection sort does have some performance advantages over more complicated sorts in certain situations, particularly where external memory is limited.

-**Time Complexity**:
- Worst Case Performance: O(n<sup>2</sup>) 
- Best Case Performance: O(n<sup>2</sup>)

**Merge Sort**
- **Implementation**: `mergeSort.swift`
- **Tests**: `MergeSortTests.swift`
- Source [Wikipedia](https://en.wikipedia.org/wiki/Merge_sort)
- Merge sort is an efficient, general-purpose sorting algorithm.
- Merge sort can be implemented to be a stable sort.
    - Make merge sort stable by using the `<=` relational operator when merging sublists,
- Conceptually, a merge sort works as follows:
    - Divides the unsorted list into <em>**n**</em> sublists, each containing 1 element (a list of 1 element is considered sorted.)
    - Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining.

-**Time Complexity**:
- Worst Case Performance: O(n log n)
- Best Case Performance: O(n log n)

**Binary Search Tree**
- **Implementation**: `bst.swift`
- **Tests**: `BinarySearchTreeTests.swift`
- Source [Wikipedia](https://en.wikipedia.org/wiki/Binary_search_tree), [Tutorial's Point](https://www.tutorialspoint.com/data_structures_algorithms/binary_search_tree.htm)
- A Binary Search Tree (BST) is a tree in which all the nodes follow the below-mentioned properties:
    - The left sub-tree of a node has a key less than or equal to its parent node's key.
    - The right sub-tree of a node has a key greater than to its parent node's key
- BST is a collection of nodes arranged in a way where they maintain BST properties. Each node has a key and an associated value. While searching, the desired key is compared to the keys in BST and if found, the associated value is retrieved.

-*BST Operations*:

    insert(data: Element) Complexity: O(log n)
    remove(data: Element) Complexity: O(log n)
    search(data: Element) Complexity: O(log n)
    preorderTraversal() Complexity: O(n) 
    //the parent is visited, then left subtree, then right subtree

    inorderTraversal() Complexity: O(n) 
    //the leftsubtree is visited, then the parent, then the right subtree

    postorderTraversal() Complexity: O(n)
    //the leftsubtree is visited, the the right subtree, then visits the parent

    
    // All of the traversal methods are going to be O(n)
    // because every node has to be visited once.



**Libraries Used**:
- [Fakery](https://github.com/vadymmarkov/Fakery) - Used to generate test data. 
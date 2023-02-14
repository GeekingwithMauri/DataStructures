//
//  BinaryTreeMother.swift
//  
//
//  Created by Mauricio Chirino on 13/2/23.
//

import DataStructures

struct BinaryTreeMother {
    static func buildSkewOne() -> BinaryTree<Int> {
        let sut = BinaryTree<Int>()

        [20, 23, 37, 39, 53, 54, 60, 76, 83, 100].forEach {
            sut.insert($0)
        }

        return sut
    }
}

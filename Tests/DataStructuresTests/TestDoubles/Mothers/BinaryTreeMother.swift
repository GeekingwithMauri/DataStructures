//
//  BinaryTreeMother.swift
//  
//
//  Created by Mauricio Chirino on 13/2/23.
//

import DataStructures

struct BinaryTreeMother {
    static func assembleSkewOne() -> BinaryTree<Int> {
        let sut = BinaryTree<Int>()

        ArrayMother.assembleSorted().forEach {
            sut.insert($0)
        }

        return sut
    }
}

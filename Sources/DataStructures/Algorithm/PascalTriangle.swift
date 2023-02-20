//
//  PascalTriangle.swift
//  
//
//  Created by Mauricio Chirino on 20/2/23.
//

import Foundation

public struct PascalTriangle {
    public static func build(for coefficient: Int) -> [Int] {
        guard coefficient > 0 else {
            return []
        }

//        let centering: String = String(repeating: " ", count: coefficient)
//        var padding: String = String(repeating: " ", count: coefficient * 2 - 1)
        var current: [Int] = Array(repeating: 1, count: coefficient + 1)
        var previous = current

//        print("\(centering)\(current[0])")
        (1..<coefficient).forEach { i in
//            padding.removeLast((padding.count / 2) + 1)
//            print("\(padding)\(current[0])", terminator: "")
            (1...i).forEach { j in
//                print("\(padding)\(current[j])", terminator: "")
                current[j] = previous[j - 1] + previous[j]
            }

//            print()
            previous = current
        }

//        current.forEach {
//            print("\($0)\(padding)", terminator: "")
//        }
//        print()
        return current
    }
}

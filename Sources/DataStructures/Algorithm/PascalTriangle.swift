//
//  PascalTriangle.swift
//  
//
//  Created by Mauricio Chirino on 20/2/23.
//

import Foundation

/// Pascal's triangle implementation
public struct PascalTriangle {
    /// Produces any binomial coefficient based on Pascal's triangle
    /// - Parameter coefficient: the desired coefficient to produce
    /// - Parameter printProcess: whether or not print in console the previous arrays to the desired coefficient array. Defaults to `true`
    /// - Returns: array with the binomial coefficients for the desired exponent.
    public static func build(for coefficient: Int, printProcess: Bool = true) -> [Int] {
        guard coefficient > 0 else {
            return []
        }

        var centering: String = String(repeating: " ", count: coefficient + 1)
        var current: [Int] = Array(repeating: 1, count: coefficient + 1)
        var previous = current

        if printProcess {
            print("\(centering)\(current[0])")
        }

        (1..<coefficient).forEach { i in
            if printProcess {
                centering = String(repeating: " ", count: coefficient - i + 1)
                print("\(centering)\(current[0])", terminator: "")
            }

            (1...i).forEach { j in
                if printProcess {
                    print(" \(current[j])", terminator: "")
                }
                current[j] = previous[j - 1] + previous[j]
            }

            previous = current

            if printProcess {
                print()
            }
        }

        if printProcess {
            current.forEach {
                print(" \($0)", terminator: "")
            }
            print()
        }

        return current
    }
}

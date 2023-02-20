//
//  ArraySearch.swift
//  
//
//  Created by Mauricio Chirino on 14/2/23.
//

import Foundation

public extension Array where Element == IntegerLiteralType {
    /// Performs a binary search a **sorted array**
    /// - Parameter value: key value to be search for
    /// - Returns: the iteration at which the value was found. Each divide and conquer cycle counts as one iteration
    ///
    /// For values beyond the array boundaries (the desired key is lower than its first element or greater than the last one), the return value is `0`.
    /// In case the value isn't found in the array, `-1` is returned as the resulting iteration
    func binarySearch(for value: Element) -> Int {
        guard let first = self.first,
              value >= first,
              let last = self.last,
              value <= last else {
            return 0
        }

        var iteration = 0
        var head = 0
        var tail = self.count - 1
        var middle = 0

        repeat {
            iteration += 1
            if (tail + head) / 2 > 1 {
                middle = Int(round((Double(tail) + Double(head)) / 2))
            } else {
                middle = (tail + head) / 2
            }

            if self[middle] == value {
                return iteration
            } else if value < self[middle] {
                tail = middle
            } else {
                head = middle
            }
        } while head <= tail && (middle > 0 && middle < self.count - 1)

        return -1
    }
}

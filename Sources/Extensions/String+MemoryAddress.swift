//
//  String+MemoryAddress.swift
//  
//
//  Created by Mauricio Chirino on 4/1/23.
//

import Foundation

extension String {
    /// Prints the memory address for any given object
    /// - Parameter object: object for which the memory address value is desired to print
    /// - Returns: memory address in String, should it exist. Otherwise returns "nil"
    static func pointer(_ object: AnyObject?) -> String {
        guard let object = object else {
            return "nil"
        }

        let opaque: UnsafeMutableRawPointer = Unmanaged.passUnretained(object).toOpaque()

        return String(describing: opaque)
    }
}

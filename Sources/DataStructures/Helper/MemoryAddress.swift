//
//  MemoryAddress.swift
//  
//
//  Created by Mauricio Chirino on 4/1/23.
//

import Foundation

func memoryAddress(for node: AnyObject?) -> String {
    if let node = node {
        return "\(Unmanaged.passUnretained(node).toOpaque())"
    } else {
        return "nil"
    }
}

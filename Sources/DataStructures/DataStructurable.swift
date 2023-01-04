//
//  DataStructurable.swift
//  
//
//  Created by Mauricio Chirino on 4/1/23.
//

import Foundation

public protocol DataStructurable: AnyObject {
    associatedtype Element

    var isEmpty: Bool { get }

    func peek() -> Element?
}

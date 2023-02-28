//
//  GraphNodesMother.swift
//  
//
//  Created by Mauricio Chirino on 9/2/23.
//

import DataStructures

struct GraphNodesMother {
    static func assembleNumericalDirectedGraph() -> GraphNode<Int> {
        let node0 = GraphNode<Int>(value: 0)
        let node1 = GraphNode<Int>(value: 1)
        let node2 = GraphNode<Int>(value: 2)
        let node3 = GraphNode<Int>(value: 3)

        node0.add(edges: [node1])
        node1.add(edges: [node2])
        node2.add(edges: [node0, node3])
        node3.add(edges: [node2])

        return node0
    }

    static func assembleAlphabeticalDirectedGraph() -> GraphNode<String> {
        let nodeA = GraphNode<String>(value: "A")
        let nodeB = GraphNode<String>(value: "B")
        let nodeC = GraphNode<String>(value: "C")
        let nodeD = GraphNode<String>(value: "D")
        let nodeE = GraphNode<String>(value: "E")
        let nodeF = GraphNode<String>(value: "F")

        nodeA.add(edges: [nodeB, nodeC])
        nodeB.add(edges: [nodeA, nodeD, nodeE])
        nodeC.add(edges: [nodeA, nodeF])
        nodeD.add(edgeNode: nodeB)
        nodeE.add(edges: [nodeB, nodeF])
        nodeF.add(edges: [nodeC, nodeE])

        return nodeA
    }
}

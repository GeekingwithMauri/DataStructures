//
//  GraphNodesMother.swift
//  
//
//  Created by Mauricio Chirino on 9/2/23.
//

import DataStructures

struct GraphNodesMother {
    static func assembleNumericalConnectedGraph() -> GraphNode<Int> {
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

    static func assembleAlphabeticalGraph() -> GraphNode<String> {
        let nodeA = GraphNode<String>(value: "A")
        let nodeB = GraphNode<String>(value: "B")
        let nodeC = GraphNode<String>(value: "C")
        let nodeD = GraphNode<String>(value: "D")
        let nodeE = GraphNode<String>(value: "E")
        let nodeF = GraphNode<String>(value: "F")

        nodeA.add(edgeNode: nodeB)
        nodeA.add(edgeNode: nodeC)
        nodeB.add(edgeNode: nodeA)
        nodeB.add(edgeNode: nodeD)
        nodeB.add(edgeNode: nodeE)
        nodeC.add(edgeNode: nodeA)
        nodeC.add(edgeNode: nodeF)
        nodeD.add(edgeNode: nodeB)
        nodeE.add(edgeNode: nodeB)
        nodeE.add(edgeNode: nodeF)
        nodeF.add(edgeNode: nodeC)
        nodeF.add(edgeNode: nodeE)

        return nodeA
    }
}

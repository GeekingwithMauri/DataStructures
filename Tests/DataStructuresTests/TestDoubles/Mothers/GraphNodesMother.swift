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

    static func assembleNumericalUndirectedGraph() -> GraphNode<Int> {
        let node0 = GraphNode<Int>(value: 0)
        let node1 = GraphNode<Int>(value: 1)
        let node2 = GraphNode<Int>(value: 2)
        let node3 = GraphNode<Int>(value: 3)

        node0.add(edges: [node1, node2])
        node1.add(edges: [node0, node2])
        node2.add(edges: [node0, node1, node3])
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
        nodeB.add(edges: [nodeD, nodeE])
        nodeC.add(edges: [nodeF])
        nodeE.add(edgeNode: nodeF)

        return nodeA
    }

    static func assembleAlphabeticalUndirectedGraph() -> GraphNode<String> {
        let nodeA = GraphNode<String>(value: "A")
        let nodeB = GraphNode<String>(value: "B")
        let nodeC = GraphNode<String>(value: "C")
        let nodeD = GraphNode<String>(value: "D")
        let nodeE = GraphNode<String>(value: "E")
        let nodeF = GraphNode<String>(value: "F")
        let nodeG = GraphNode<String>(value: "G")
        let nodeH = GraphNode<String>(value: "H")

        nodeA.add(edges: [nodeB, nodeC, nodeD, nodeE])
        nodeB.add(edges: [nodeA, nodeC, nodeG])
        nodeC.add(edges: [nodeA, nodeB, nodeD])
        nodeD.add(edges: [nodeA, nodeC, nodeE, nodeH])
        nodeE.add(edges: [nodeA, nodeD, nodeF])
        nodeF.add(edges: [nodeE, nodeG, nodeH])
        nodeG.add(edges: [nodeB, nodeF])
        nodeH.add(edges: [nodeD, nodeF])

        return nodeA
    }
}

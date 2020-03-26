import 'node.dart';
import 'package:collection/collection.dart';

class DPQ {
  List dist;
  Set<int> visited;
  PriorityQueue<Node> pq;
  int V;
  List<List<Node>> adj;
  Map<int, List<Node>> previous;
  Node last;

  DPQ(this.V) {
    dist = new List(V);
    visited = new Set<int>();
    pq = PriorityQueue<Node>();
    last = null;
    previous = {};
  }

  // Function for Dijkstra's Algorithm
  void dijkstra(List<List<Node>> adj, Node src, int end) {
    this.adj = adj;

    for (int i = 0; i < V; i++) dist[i] = double.infinity;

    // Add source node to the priority queue
    pq.add(src);

    // Distance to the source is 0
    dist[src.node] = 0;
    while (visited.length != V) {
      // remove the minimum distance node
      // from the priority queue
      Node checking = pq.removeFirst();

      // adding the node whose distance is finalized
      visited.add(checking.node);

      e_Neighbours(checking);
      last = checking;
    }
  }

  void e_Neighbours(Node checking) {
    int edgeDistance = -1;
    int newDistance = -1;

    // All the neighbors of v
    for (int i = 0; i < adj[checking.node].length; i++) {
      Node v = adj[checking.node][i];

      // If current node hasn't already been processed
      if (!visited.contains(v.node)) {
        edgeDistance = v.cost;
        newDistance = dist[checking.node] + edgeDistance;

        // If new distance is cheaper in cost
        if (newDistance < dist[v.node]) {
          v.previous = checking;
          if (previous[v.node] == null) {
            previous[v.node] = [];
          }
          previous[v.node].add(checking);
          dist[v.node] = newDistance;
        }

        // Add the current node to the queue
        pq.add(Node(v.node, dist[v.node]));
      }
    }
  }
}

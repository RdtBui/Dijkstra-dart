import 'node.dart';
import 'package:collection/collection.dart';

class DPQ {
  List dist;
  Set<int> settled;
  // @@@@ Add priority queue library or clas @@@@    -->    PriorityQueue<Node> pq;
  PriorityQueue<Node> pq;
  int V;
  List<List<Node>> adj;
  Map<int, List<Node>> previous;
  Node last;

  DPQ(this.V) {
    dist = new List(V);
    settled = new Set<int>();
    pq = PriorityQueue<Node>();
    last = null;
    previous = {};
  }
  // Add priorityqueue library or class
  // @@@@ Add priority queue library or clas @@@@     -->    pq = new PriorityQueue<Node>(V, new Node());

  // Function for Dijkstra's Algorithm
  void dijkstra(List<List<Node>> adj, Node src) {
    this.adj = adj;

    for (int i = 0; i < V; i++) dist[i] = double.infinity;

    // Add source node to the priority queue
    // @@@@ Add priority queue library or clas @@@@     -->    pq.add(new Node(src, 0));
    pq.add(src);

    // Distance to the source is 0
    dist[src.node] = 0;
    while (settled.length != V) {
      // remove the minimum distance node
      // from the priority queue
      // @@@@ Add priority queue library or clas @@@@     -->    int u = pq.remove().node;
      Node u = pq.removeFirst();

      //int u =
      //5; // For testing purposes only. remove after implement real priority queue

      // adding the node whose distance is finalized
      settled.add(u.node);

      e_Neighbours(u);
      last = u;
    }
  }

  void e_Neighbours(Node u) {
    int edgeDistance = -1;
    int newDistance = -1;

    // All the neighbors of v
    for (int i = 0; i < adj[u.node].length; i++) {
      Node v = adj[u.node][
          i]; // Java: Node v = adj.get(u).get(i); , I think? Hopefully not 2d array syntax

      // If current node hasn't already been processed
      if (!settled.contains(v.node)) {
        edgeDistance = v.cost;
        newDistance = dist[u.node] + edgeDistance;

        // If new distance is cheaper in cost
        if (newDistance < dist[v.node]) {
          u.previous = v;
          if (previous[v.node] == null) {
            previous[v.node] = [];
            previous[v.node].add(u);
          }
          dist[v.node] = newDistance;
        }

        // Add the current node to the queue
        // @@@@ Add priority queue library or clas @@@@    -->    pq.add(new Node(v.node, dist[v.node]));
        pq.add(Node(v.node, dist[v.node]));
      }
    }
  }
}

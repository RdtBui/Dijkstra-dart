import 'node.dart';
import 'dpq.dart';

void main() {
  int V = 9;
  int source = 0;
  // Adjacency list representation of the
  // connected edges
  List<List<Node>> adj = new List<List<Node>>();
  // Initialize list for every node
  for (int i = 0; i < V; i++) {
    List<Node> item = new List<Node>();
    adj.add(item);
  }
  // Inputs for the DPQ graph
  adj[0].add(new Node(1, 4));
  adj[0].add(new Node(7, 8));
  adj[1].add(new Node(0, 4));
  adj[1].add(new Node(7, 11));
  adj[1].add(new Node(2, 8));
  adj[2].add(new Node(1, 8));
  adj[2].add(new Node(3, 7));
  adj[2].add(new Node(5, 4));
  adj[2].add(new Node(8, 2));
  adj[3].add(new Node(2, 7));
  adj[3].add(new Node(4, 9));
  adj[3].add(new Node(5, 14));
  adj[4].add(new Node(3, 9));
  adj[4].add(new Node(5, 10));
  adj[5].add(new Node(2, 4));
  adj[5].add(new Node(3, 14));
  adj[5].add(new Node(4, 10));
  adj[5].add(new Node(6, 2));
  adj[6].add(new Node(5, 2));
  adj[6].add(new Node(7, 1));
  adj[6].add(new Node(8, 6));
  adj[7].add(new Node(0, 8));
  adj[7].add(new Node(1, 11));
  adj[7].add(new Node(6, 1));
  adj[7].add(new Node(8, 7));
  adj[8].add(new Node(2, 2));
  adj[8].add(new Node(6, 6));
  adj[8].add(new Node(7, 7));
  // Calculate the single source shortest path
  DPQ dpq = new DPQ(V);
  dpq.dijkstra(adj, Node(source, 0));
  // Print the shortest path to all the nodes
  // from the source node
  print("The shorted path from node :");
  for (int i = 0; i < dpq.dist.length; i++) {
    print("$source to $i is ${dpq.dist[i]}");
  }
  print(dpq.settled);
}

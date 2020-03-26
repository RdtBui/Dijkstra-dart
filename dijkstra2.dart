/*import 'node.dart';

void main() {
  int V = 5;
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
  adj[0].add(new Node(1, 9));
  adj[0].add(new Node(2, 6));
  adj[0].add(new Node(3, 5));
  adj[0].add(new Node(4, 3));

  adj[2].add(new Node(1, 2));
  adj[2].add(new Node(3, 4));

  // Calculate the single source shortest path
  //DPQ dpq = new DPQ(V);
  //dpq.dijkstra(adj, source);

  // Print the shortest path to all the nodes
  // from the source node
  print("The shortest path from node :");
  for (int i = 0; i < dpq.dist.length; i++)
    print("$source to  ${i}  is  ${dpq.dist[i]}");
}
*/

class Node implements Comparable<Node> {
  // + implements Comparable?
  int node;
  int cost;
  Node previous;

  Node(this.node, this.cost);

  @override
  int compareTo(Node other) {
    if (this.cost < other.cost) return -1;
    if (this.cost > other.cost) return 1;
    return 0;
  }
}
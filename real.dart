import 'dart:collection';

import 'package:collection/collection.dart';

class Node implements Comparable<Node> {
  String name;
  int distance;
  Map<Node, int> edges;
  Node previous;

  Node(String name, this.edges, [this.distance = 9999]) {
    this.name = name;
    this.edges?.forEach((key, value) => key.edges[this] = value);
  }

  @override
  int compareTo(Node other) {
    if (distance > other.distance)
      return 1;
    else if (distance < other.distance)
      return -1;
    else
      return 0;
  }
}

Node compute(Map<String, Node> nodes, String start, String end) {
  PriorityQueue<Node> pq = PriorityQueue<Node>();
  nodes[start].distance = 0;

  nodes.forEach((key, node) {
    if (key != start) {
      node.distance = 9999;
      node.previous = null;
    }

    pq.add(node);
  });

  while (pq.isNotEmpty) {
    Node u = pq.removeFirst();
    u.edges.forEach((v, distance) {
      int newDistance = nodes[u.name].distance + u.edges[v];
      if (newDistance < v.distance) {
        v.distance = newDistance;
        v.previous = u;
        nodes[v.name] = v;
        pq.add(v);
      }
    });
  }

  return nodes[end];
}

Queue<Node> getPath(Node node) {
  Queue<Node> reversed = Queue<Node>();
  reversed.addFirst(node);
  while(node.previous != null) {
    reversed.addFirst(node.previous);
    node = node.previous;
  }

  return reversed;
}

void main() {
  Node n1 = Node("n1", {});
  Node n2 = Node("n2", {n1: 50});
  Node n3 = Node("n3", {n1: 10, n2: 5});
  Node n4 = Node("n4", {n2: 500, n3: 1});
  Node n5 = Node("n5", {n1: 2, n3: 1});
  Node n6 = Node("n6", {n5: 1, n4: 5});

  Map<String, Node> nodes = {
    "n1": n1,
    "n2": n2,
    "n3": n3,
    "n4": n4,
    "n5": n5,
    "n6": n6,
  };

  Node result = compute(nodes, "n1", "n6");
  
  List<Node> list = getPath(result).toList();
  list.forEach((node) => print(node.name));
}

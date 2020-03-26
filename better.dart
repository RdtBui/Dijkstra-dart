// dart port of https://www.geeksforgeeks.org/java-program-for-dijkstras-shortest-path-algorithm-greedy-algo-7/
// A Java program for Dijkstra's
// single source shortest path
// algorithm. The program is for
// adjacency matrix representation
// of the graph.

import 'dart:io';

class Node {
  String name;
  int distance;

  Node(String name, int distance);
}

class DijkstrasAlgorithm {
  static final int NO_PARENT = -1;

  // Function that implements Dijkstra's
  // single source shortest path
  // algorithm for a graph represented
  // using adjacency matrix
  // representation
  static List<int> dijkstra(List<List<int>> adjacencyMatrix, int startVertex) {
    int nVertices = adjacencyMatrix[0].length;

    // shortestDistances[i] will hold the
    // shortest distance from src to i
    List<int> shortestDistances = List<int>(nVertices);

    // added[i] will true if vertex i is
    // included / in shortest path tree
    // or shortest distance from src to
    // i is finalized
    List<bool> added = List<bool>(nVertices);

    // Initialize all distances as
    // INFINITE and added[] as false
    for (int vertexIndex = 0; vertexIndex < nVertices; vertexIndex++) {
      shortestDistances[vertexIndex] = 9999;
      added[vertexIndex] = false;
    }

    // Distance of source vertex from
    // itself is always 0
    shortestDistances[startVertex] = 0;

    // Parent array to store shortest
    // path tree
    List<int> parents = List<int>(nVertices);

    // The starting vertex does not
    // have a parent
    parents[startVertex] = NO_PARENT;

    // Find shortest path for all
    // vertices
    for (int i = 1; i < nVertices; i++) {
      // Pick the minimum distance vertex
      // from the set of vertices not yet
      // processed. nearestVertex is
      // always equal to startNode in
      // first iteration.
      int nearestVertex = -1;
      int shortestDistance = 9999;
      for (int vertexIndex = 0; vertexIndex < nVertices; vertexIndex++) {
        if (!added[vertexIndex] &&
            shortestDistances[vertexIndex] < shortestDistance) {
          nearestVertex = vertexIndex;
          shortestDistance = shortestDistances[vertexIndex];
        }
      }

      // Mark the picked vertex as
      // processed
      added[nearestVertex] = true;

      // Update dist value of the
      // adjacent vertices of the
      // picked vertex.
      for (int vertexIndex = 0; vertexIndex < nVertices; vertexIndex++) {
        int edgeDistance = adjacencyMatrix[nearestVertex][vertexIndex];

        if (edgeDistance > 0 &&
            ((shortestDistance + edgeDistance) <
                shortestDistances[vertexIndex])) {
          parents[vertexIndex] = nearestVertex;
          shortestDistances[vertexIndex] = shortestDistance + edgeDistance;
        }
      }
    }

    printSolution(startVertex, shortestDistances, parents);
    return parents;
  }

  // A utility function to print
  // the constructed distances
  // array and shortest paths
  static void printSolution(
      int startVertex, List<int> distances, List<int> parents) {
    int nVertices = distances.length;
    print("Vertex\tDistance\tPath");

    for (int vertexIndex = 0; vertexIndex < nVertices; vertexIndex++) {
      if (vertexIndex != startVertex) {
        stdout.write("$startVertex  -> $vertexIndex ");
        stdout.write("${distances[vertexIndex]}] \t\t");
        printPath(vertexIndex, parents);
        print(""); // keep this, dont ask
      }
    }
  }

  // Function to print shortest path
  // from source to currentVertex
  // using parents array
  static void printPath(int currentVertex, List<int> parents) {
    // Base case : Source node has
    // been processed
    if (currentVertex == NO_PARENT) {
      return;
    }
    printPath(parents[currentVertex], parents);
    stdout.write("[${parents[currentVertex]}: $currentVertex] ");
  }
}

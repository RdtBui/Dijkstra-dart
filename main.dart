import 'better.dart';

// Driver Code
void main() {
  // there HAS to be a value for every 9th column in the adjacency matrix.
  // i.e., if we have 11 values, index 10 has to be definee in one of the rows.
  List<List<int>> adjacencyMatrix = [
    [0, 4, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0],
    [4, 0, 8, 0, 0, 0, 0, 11, 0, 0, 0, 0],
    [0, 8, 0, 7, 0, 4, 0, 0, 2, 0, 0, 0],
    [0, 0, 7, 0, 9, 14, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 9, 0, 10, 0, 0, 0, 0, 9, 0],
    [0, 0, 4, 0, 10, 0, 2, 0, 0, 0, 0, 0],
    [0, 0, 0, 14, 0, 2, 0, 1, 6, 8, 0, 9],
    [8, 11, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0],
    [0, 0, 2, 0, 0, 0, 6, 7, 0, 0, 0, 0],
    [0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0]
  ];
  List<int> parents = DijkstrasAlgorithm.dijkstra(adjacencyMatrix, 0);
  print(parents);
}

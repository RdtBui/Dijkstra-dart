import 'dart:collection';

class Vertex { // + implements Comparable?
  final int distance;

  Vertex ([this.distance = 0]): assert(distance >= 0);

  bool operator < (Vertex other) => this.distance < other.distance;
  bool operator > (Vertex other) => this.distance > other.distance;
}

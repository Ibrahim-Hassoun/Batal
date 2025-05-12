import 'dart:math';



class Geometry {
  /// Calculates the angle (in degrees) formed at (x2, y2) by the points (x1, y1), (x2, y2), (x3, y3)
  static double calculateAngle(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    // Vectors: A = (x1, y1) - (x2, y2), B = (x3, y3) - (x2, y2)
    double ax = x1 - x2;
    double ay = y1 - y2;
    double bx = x3 - x2;
    double by = y3 - y2;

    // Dot product and magnitudes
    double dot = ax * bx + ay * by;
    double magA = sqrt(ax * ax + ay * ay);
    double magB = sqrt(bx * bx + by * by);

    if (magA == 0 || magB == 0) return 0.0;

    double cosTheta = dot / (magA * magB);
    // Clamp value to [-1, 1] to avoid NaN due to floating point errors
    cosTheta = cosTheta.clamp(-1.0, 1.0);

    double angleRad = acos(cosTheta);
    return angleRad * 180 / 3.1415926535897932;
  }


  // static double calculateDistance(double x1, double y1, double x2, double y2) {
  //   return ((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1));
  // }
}
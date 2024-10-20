class Point {
  int x;
  int y;

  Point(this.x, this.y);

  @override
  String toString() {
    return "x= $x - y= $y";
  }

  void translate(int dx, int dy) {
    x += dx;
    y += dy;
  }
}
class Distance{
  final double _meter;
  Distance.cms (double centimeters) : _meter = centimeters / 100;
  Distance.meters(double meters) : _meter = meters;
  Distance.kms (double kilometers) : _meter =kilometers *1000;
  
  double get cms => _meter *100;
  double get meters => _meter;
  double get kms => _meter / 1000;

  Distance operator + (Distance other){
    return Distance.meters(this._meter + other._meter);
  }
  @override
  String toString(){
    return 'Distance: ${_meter} meters';
  }

}

main() {
  // Point p1 = Point(1, 2);
  // print(p1);

  // print(p1);
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);
  print((d1+d2).kms);
}
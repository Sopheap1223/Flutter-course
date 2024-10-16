// Class Tree
import 'dart:ffi';

class Window {
  String position;
  String color;
  double wieght;
  double height;
  Window(this.color,this.position,this.wieght,this.height);
}
class Door {
  String position;
  String color;
  double wieght;
  double height;
  Door(this.color,this.height,this.position,this.wieght);
}
class Roof{
  String position;
  Double wieght;
  double height;
  Roof(this.height,this.position,this.wieght);
}
class Chimney{
  double wieght;
  double height;
  Chimney(this.height,this.wieght);
}


// Class House
class House {
  String address;
  List<Window> window = [];
  List<Door> door = [];
  List<Roof> roof= [];
  List<Chimney> chimney = [];
  

  House(this.address);

  
}


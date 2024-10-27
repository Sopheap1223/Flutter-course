
import 'dart:ffi';
enum type{square("square"), circle("circle"), triangle("triangle"), ractangle("ractangle");
  final String label;
  const type (this.label);
  String toString()=>label;
}
enum position{topLeft,topRight,bottomLeft,bottomRight,center,top;

}
enum color{red,green,blue,black}
class Window {
  type Type ;
  position Position;
  color Color;
  double wieght;
  double height;
  Window({required this.Color,required this.Position,required this.wieght,required this.height, this.Type = type.ractangle});
}
class Door {
  type Type;
  position Position ;
  color Color;
  double wieght;
  double height;
  Door({required this.Color,required this.height,required this.Position,required this.wieght,this.Type = type.ractangle});
}
class Roof{
  position Position;
  Double wieght;
  double height;
  List<Chimney> chimney = [];
  Roof({required this.height,required this.Position,required this.wieght,});
  
}
class Chimney{
  double wieght;
  double height;
  Chimney(this.height,this.wieght);
}


// Class House
class House {
  String address;
  List<Window> window = [Window(Color: color.red, Position: position.topLeft, wieght: 2.5, height: 3),];
  List<Door> door = [Door(Color:color.black, height: 4, Position: position.center, wieght: 3)];
  List<Roof> roof= [Roof(height: 3, Position: position.top, wieght: 2)];
  List<Chimney> chimney = [Chimney(5.0, 8)];
  

  House(this.address);
}

void main() {
  
}


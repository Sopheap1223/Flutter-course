import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container( 
      padding: const EdgeInsets.all(50.0),
      margin: const EdgeInsets.all(40.0),
      decoration: const BoxDecoration(color:Color.fromARGB(100, 0, 115, 255)),
      child: Container(
        decoration: const BoxDecoration(color:Color.fromARGB(255, 0, 115, 255),
        borderRadius: BorderRadius.all(Radius.circular(5))),
        child: const Center(
          child:  Text("CADT STUDENTS",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),decoration: TextDecoration.none)),
        ),
      ),
    ),
  ));
}

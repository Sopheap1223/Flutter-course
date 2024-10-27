import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container( 
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [Container(
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: const BoxDecoration(color: Color.fromARGB(97, 0, 39, 255),
          borderRadius: BorderRadius.all(Radius.circular(50))),
          child: const Center(
            child: Text("OOP",style: TextStyle(color: Color.fromARGB(100, 255, 255, 255),decoration: TextDecoration.none),
          ),          
        )),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: const BoxDecoration(color: Color.fromARGB(200, 0, 39, 255),
          borderRadius: BorderRadius.all(Radius.circular(50))),
          child: const Center(
            child: Text("DART",style: TextStyle(color: Color.fromARGB(200, 255, 255, 255),decoration: TextDecoration.none),
          ),          
        )),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: const BoxDecoration(gradient: LinearGradient(
      begin: Alignment.bottomRight, // Starting point
      end: Alignment.topLeft, // Ending point
      colors: [
        Color.fromARGB(255, 35, 50, 63), // Start color
        Color.fromARGB(255, 13, 0, 255), // End color
      ],
    ),
          borderRadius: BorderRadius.all(Radius.circular(50))),
          child: const Center(
            child: Text("FLUTTER",style: TextStyle(color: Color.fromARGB(250, 255, 255, 255),decoration: TextDecoration.none),
          ),          
        ))],
        
        
      ),
      
    ),
  ));
}

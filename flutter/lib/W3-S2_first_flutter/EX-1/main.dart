import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp (
      home:Scaffold(
        body:Center(
          child: Text("hello world",
          style: TextStyle(color:Color.fromARGB(255, 5, 7, 255),),
        )
      )
      )));
}
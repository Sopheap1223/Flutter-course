import 'package:flutter/material.dart';
import 'Gradiant_widget.dart';


void main() {
  runApp(
    const MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(text: "HELLO1", startColor: Color(0xff4E7DF5), endColor: Color.fromARGB(255, 189, 11, 11)),
            GradientButton(text: "HELLO2", startColor: Color(0xff4E7DF5), endColor: Color.fromARGB(255, 189, 11, 11)),
            GradientButton(text: "HELLO3", startColor: Color(0xff4E7DF5), endColor: Color.fromARGB(255, 189, 11, 11)),
          ],
        ),
      ),
    ),
  );
}
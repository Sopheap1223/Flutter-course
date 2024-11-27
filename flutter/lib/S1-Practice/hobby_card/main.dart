import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  //button property
  final String text;
  final Color backgroundColor;

  const GradientButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
void main() {
  runApp(
    const MaterialApp (
      
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(text: "Travelling", backgroundColor: Color.fromARGB(255, 90, 250, 0),),
            GradientButton(text: "Travelling", backgroundColor: Color.fromARGB(255, 20, 134, 175),)
          ],
        ),
      ),
      ));
}
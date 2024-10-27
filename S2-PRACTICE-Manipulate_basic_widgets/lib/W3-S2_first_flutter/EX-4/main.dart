// Start from the exercice 3 code
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  const MyButton({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(35), 
              gradient: const LinearGradient(colors: [
                Color(0xff4E7DF5), Color(0xff0B3CBD)
              ])
              ),
              child: const Text(
                "HELLO1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
                    
              ),
            );
  }
}
class GrdiantButton extends StatelessWidget {
  const GrdiantButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
void main() {
  runApp(
     const MaterialApp(
      home: Center(
        child: Column(
            children: [MyButton(),MyButton()]
            ,children:[GradientRotation(radians)]
        ),
      ),
    ),
  );
}


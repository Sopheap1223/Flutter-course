import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Container(
          color: const Color.fromARGB(255, 114, 111, 111),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              HobbyCard(
                icon: Icons.flight_takeoff,
                text: 'Travelling',
                backgroundColor: Colors.green,
                iconPadding: EdgeInsets.only(left: 30, top: 20),
                textPadding: EdgeInsets.only(left: 20, top: 20),
              ),
              SizedBox(height: 20),
              HobbyCard(
                icon: Icons.skateboarding,
                text: 'Skating',
                backgroundColor: Colors.blueGrey,
                iconPadding: EdgeInsets.only(left: 40, top: 20),
                textPadding: EdgeInsets.only(left: 40, top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final EdgeInsets iconPadding;
  final EdgeInsets textPadding;

  HobbyCard({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.iconPadding,
    required this.textPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: iconPadding,
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          Padding(
            padding: textPadding,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

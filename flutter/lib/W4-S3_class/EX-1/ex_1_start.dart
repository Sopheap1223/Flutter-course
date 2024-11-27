import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            children: [
              CustomButton(),
            ],
          ),
        ),
      ),
    ));

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
              onPressed: () => {},
              child: const Center(
                child: Text("Not Selected"),
              )),
        );
  }
}

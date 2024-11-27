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
          title: Text("Custom Button"),
          centerTitle: false, // Aligns title to the start (left)
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(
                label: "Submit",
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 16, width: double.infinity),
              CustomButton(
                label: "Time",
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 16,width: double.infinity),
              CustomButton(
                label: "Account",
                icon: Icons.account_balance,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);

  Color getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: getButtonColor(),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, size: 20),
                SizedBox(width: 8),
                Text(label),
              ]
            : [
                Text(label),
                SizedBox(width: 8),
                Icon(icon, size: 20),
              ],
      ),
    );
  }
}

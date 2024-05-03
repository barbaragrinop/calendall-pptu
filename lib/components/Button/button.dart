import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final bool isEnabled;
  final void Function()? onPressed;
  final Color color;

  const Button({
    super.key,
    required this.name,
    required this.isEnabled,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(name),
    );
  }
}
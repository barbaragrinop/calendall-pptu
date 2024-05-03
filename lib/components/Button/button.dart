import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.text,
    this.isEnabled = true,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      child: Text(text),
    );
  }
}

import 'package:flutter/material.dart';

class SwitchPrimary extends StatefulWidget {
  const SwitchPrimary({super.key});

  @override
  State<SwitchPrimary> createState() => _SwitchPrimaryState();
}

class _SwitchPrimaryState extends State<SwitchPrimary> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.red,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

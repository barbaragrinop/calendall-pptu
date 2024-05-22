
import 'package:flutter/material.dart';
import 'package:frontend/util/custom_colors.dart';

class InputSwitch extends StatefulWidget {
  const InputSwitch({super.key});

  @override
  State<InputSwitch> createState() => _InputSwitchState();
}

class _InputSwitchState extends State<InputSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: CustomColors.blueSecondary,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

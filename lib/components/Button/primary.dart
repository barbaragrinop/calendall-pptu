import 'package:calendall_pptu/components/Button/button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends Button {

  const PrimaryButton({
    Key? key,
    required String name,
    required bool isEnabled,
    required Function()? onPressed,
  }) : super(
    key: key,
    name: name,
    isEnabled: isEnabled,
    onPressed: onPressed,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(name));
  }
}

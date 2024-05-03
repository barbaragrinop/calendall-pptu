import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool isEnabled;
  final TextInputType inputType;
  final TextCapitalization textCapitalization;

  const InputPassword({
    super.key, 
    required this.controller, 
    required this.name, 
    required this.isEnabled,
    required this.inputType, 
    required this.textCapitalization
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: 
        TextField (
          controller: controller,
          enabled: isEnabled,
          maxLines: 1,
          keyboardType: inputType,
          textAlign: TextAlign.start,
          textCapitalization: textCapitalization,
          obscureText: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16, 
          ),
          decoration: InputDecoration (
            filled: true,
            fillColor: Colors.white,
            labelText: name,
            counterText: "", 
            labelStyle: const TextStyle (color: CustomColors.primaryGray), 
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), 
              borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), 
              borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), 
              borderRadius: BorderRadius.all(Radius.circular(6))
            ),
          ),
        )
    );
  }
} 
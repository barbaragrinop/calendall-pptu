import 'package:calendall_pptu/util/custom-colors.dart';
import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool isEnable;
  final TextInputType inputType;
  final TextCapitalization textCapitalization;

  const FieldText({
    super.key, 
    required this.controller, 
    required this.name, 
    required this.isEnable,
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
          enabled: isEnable,
          maxLines: 1,
          keyboardType: inputType,
          textAlign: TextAlign.start,
          textCapitalization: textCapitalization,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16, 
          ),
          decoration: InputDecoration (
            labelText: name,
            counterText: "", 
            labelStyle: const TextStyle (color: CustomColors.PrimaryGray), 
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.PrimaryGray), 
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.PrimaryGray), 
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.PrimaryGray), 
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        )
    );
  }
} 
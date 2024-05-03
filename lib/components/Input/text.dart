import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool isEnabled;
  final TextInputType inputType;
  final TextCapitalization textCapitalization;
  final bool hasBorder;

  const InputText({
    required this.controller, 
    required this.name, 
    required this.isEnabled,
    required this.inputType, 
    required this.textCapitalization, 
    required this.hasBorder,
    super.key, 
  });
  

@override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        maxLines: 1,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        textCapitalization: textCapitalization,
        style: const TextStyle(
          color: CustomColors.primaryGray,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: name,
          filled: true,
          fillColor: Colors.white,
          counterText: "",
          labelStyle: const TextStyle(color: CustomColors.primaryGray),
          border: hasBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.blueDark1), // Use CustomColors.blueDark1 if intended
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent), // Use CustomColors.blueDark1 if intended
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
          enabledBorder: hasBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.blueDark1), // Use CustomColors.blueDark1 if intended
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent), // Use CustomColors.blueDark1 if intended
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
          focusedBorder: hasBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.blueDark1), // Use CustomColors.blueDark1 if intended
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent), // Use CustomColors.blueDark1 if intended
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
        ),
      ),
    );
  }
}
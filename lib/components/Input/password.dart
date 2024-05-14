import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String? parm)? onChanged;
  final Function(String? parm)? validator;
  final String name;
  final bool isEnabled;
  final TextInputType inputType;
  final TextCapitalization textCapitalization;
  final bool hasBorder;

  const InputPassword({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    required this.name,
    required this.isEnabled,
    required this.inputType,
    required this.textCapitalization,
    this.hasBorder = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          enabled: isEnabled,
          validator: validator != null ? (value) => validator!(value) : null,
          onChanged: onChanged != null ? (value) => onChanged!(value) : null,
          maxLines: 1,
          keyboardType: inputType,
          textAlign: TextAlign.start,
          textCapitalization: textCapitalization,
          obscureText: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: name,
            counterText: "",
            labelStyle: const TextStyle(color: CustomColors.primaryGray),
            border: hasBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColors
                            .blueDark1), // Use CustomColors.blueDark1 if intended
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .transparent), // Use CustomColors.blueDark1 if intended
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
            enabledBorder: hasBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColors
                            .blueDark1), // Use CustomColors.blueDark1 if intended
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .transparent), // Use CustomColors.blueDark1 if intended
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
            focusedBorder: hasBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColors
                            .blueDark1), // Use CustomColors.blueDark1 if intended
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .transparent), // Use CustomColors.blueDark1 if intended
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/util/custom_colors.dart';

class InputSelect extends StatefulWidget {
  final List<String> options;
  final String label;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final Function(String?)? onChanged;

  const InputSelect({
    Key? key,
    required this.options,
    required this.label,
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  InputSelectState createState() => InputSelectState();
}

class InputSelectState extends State<InputSelect> {
  String? _selectedOption;

  Color getColorForOption(String option) {
    switch (option) {
      case 'Alta':
        return CustomColors.red;
      case 'Média':
        return CustomColors.yellow;
      case 'Baixa':
        return CustomColors.blueMedium;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(color: CustomColors.primaryGray),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
                widget.onChanged?.call(value);
              });
            },
            validator: (String? value) {
              return widget.validator?.call(value);
            },
            items: widget.options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getColorForOption(option),
                      ),
                    ),
                    Text(option),
                  ],
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.blueDark1),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.blueDark1),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.blueDark1),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

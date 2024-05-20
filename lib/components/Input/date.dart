import 'package:flutter/material.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:intl/intl.dart';

class InputDate extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String? parm)? onChanged;
  final String name;
  final bool isEnabled;
  final bool hasBorder;

  const InputDate({
    super.key,
    this.controller,
    this.onChanged,
    required this.name,
    required this.isEnabled,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        enabled: isEnabled,
        decoration: InputDecoration(
          labelText: name,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.calendar_today), // Add icon here
          border: hasBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.blueDark1),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
          enabledBorder: hasBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.blueDark1),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
          focusedBorder: hasBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.blueDark1),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
        ),
          onTap: () async {
          // Handle date picker selection
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            // Specify the desired selection mode
            //  builder: (context, child) {
            //   if (Theme.of(context).platform == TargetPlatform.android) {
            //     return child; // Keep original date picker for Android
            //   } else {
            //     // Wrap the child date picker with a custom widget
            //     // to filter selectable days for other platforms
            //     return _DateOnlyDatePicker(child: child);
            //   }
            // },
          );
          if (selectedDate != null) {
            // Format the date to DD/MM/YYYY
            final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
            controller?.text = formattedDate;
            onChanged?.call(formattedDate);
          }
        },
      ),
    );
  }
}

// class _DateOnlyDatePicker extends StatelessWidget {
//   final Widget child;

//   const _DateOnlyDatePicker({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DatePicker(
//         // Delegate date picker functionality to child
//         delegate: (DatePickerEntryMode mode) => child.delegate(mode),
//         // Override selectable day predicate for date-only selection
//         selectableDayPredicate: (date) => date.day == 1, // Only allow the first day of each month
//       ),
//     );
//   }
// }
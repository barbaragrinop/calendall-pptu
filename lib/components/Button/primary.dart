import 'package:frontend/components/Button/button.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends Button {

  const PrimaryButton({
    super.key,
    required super.text,
    super.isEnabled,
    required Function()? super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.8, 
      width: double.infinity,
      height: 45,
      child: TextButton(onPressed: onPressed, style: TextButton.styleFrom(
      foregroundColor: CustomColors.blueDark1, 
      backgroundColor: CustomColors.blueDark1, 
      padding: const EdgeInsets.all(16.0), 
      shape: RoundedRectangleBorder( // Removi o MaterialStateProperty.all<>
        borderRadius: BorderRadius.circular(6.0), // Define o raio como 0 para um botão retangular
      ),
      
    ), child: Text(text, style: const TextStyle(color: Colors.white))));
  }
}

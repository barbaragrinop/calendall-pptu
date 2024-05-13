import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final now = DateTime.now().year;
  static const double fontSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.blueMedium,
      height: 17.0, 
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Todos os direitos reservados © ',
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
              TextSpan(
                text: '$now',
                style: const TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

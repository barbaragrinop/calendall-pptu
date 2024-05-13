import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

enum LogoTextColor {
  blueDark,
  white02,
}

class LogoText extends StatelessWidget {
  final LogoTextColor color;

  const LogoText({super.key, this.color = LogoTextColor.blueDark});

  Color _getTextColor() {
    switch (color) {
      case LogoTextColor.blueDark:
        return CustomColors.blueDark;
      case LogoTextColor.white02:
        return CustomColors.white02;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        heightFactor: 0.6,
        child: Text(
          "Calendall",
          style: TextStyle(
            fontFamily: 'Stalemate',
            fontSize: 60,
            color: _getTextColor(),
          ),
        ));
  }
}

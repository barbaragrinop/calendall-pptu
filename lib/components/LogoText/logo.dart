import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key });

  @override
  Widget build(BuildContext context){
    return const Text("Calendall", style: TextStyle( 
      fontFamily: 'Stalemate',
      fontSize: 70,
      color: CustomColors.blueDark
    ),);
  }
}
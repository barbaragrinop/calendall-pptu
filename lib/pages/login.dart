import 'package:calendall_pptu/components/Input/password.dart';
import 'package:calendall_pptu/components/Input/text.dart';
import 'package:calendall_pptu/components/LogoText/logo.dart';
import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/logo.svg'), //   <--- image
            const LogoText(),
            InputText(
              controller: emailController,
              name: "E-mail",
              isEnabled: true,
              inputType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
              hasBorder: false,
            ),
            InputPassword(
              controller: passwordController,
              name: "Password",
              isEnabled: true,
              inputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            Container(
              alignment: Alignment.topRight,
              child: const Text("Esqueceu a senha?",
                style: TextStyle(
                  shadows: [Shadow(color: CustomColors.primaryGray, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColors.primaryGray,
                  decorationThickness: 1
                ), 
              ),
            ), 
            
          ],
        ),
      ),
    );
  }
}

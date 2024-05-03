import 'package:calendall_pptu/components/Input/password.dart';
import 'package:calendall_pptu/components/Input/text.dart';
import 'package:calendall_pptu/util/custom-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: CustomColors.BlueLight,
      body: SingleChildScrollView(
        
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/logo.svg'), //   <--- image
            FieldText(
              controller: emailController, 
              name: "E-mail", 
              isEnable: true, 
              inputType: TextInputType.emailAddress, 
              textCapitalization: TextCapitalization.words,
            ),
            FieldPassword(
              controller: passwordController, 
              name: "Password", 
              isEnable: true, 
              inputType: TextInputType.text, 
              textCapitalization: TextCapitalization.words,
            )
          ],
        ),
      ),
    );
  }
}
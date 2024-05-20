import 'package:frontend/components/Button/primary.dart';
import 'package:frontend/components/Footer/primary.dart';
import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Input/password.dart';
import 'package:frontend/pages/forgot_password/recovery_code.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(hasReturnIcon: true),
        backgroundColor: CustomColors.white01,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                // margin: const EdgeInsets.only(top: 45.0, bottom: 35.0),
                child: const Text(
                  "Recuperar senha",
                  style: TextStyle(
                      fontFamily: 'AmaticSC',
                      fontSize: 40,
                      color: CustomColors.blueDark),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 45.0, bottom: 45.0),
                child: const Text(
                  "Digite sua nova senha",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: CustomColors.blueDark),
                  textAlign: TextAlign.center,
                ),
              ),
              InputPassword(
                controller: passwordController,
                name: "Nova senha",
                isEnabled: true,
                inputType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              InputPassword(
                controller: confirmPasswordController,
                name: "Confirmação de Senha",
                isEnabled: true,
                inputType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: PrimaryButton(
                      text: "Alterar senha",
                      onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage())),
                      isEnabled: true)),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecoveryCodePage())),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: const Text(
                      "Voltar",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: CustomColors.blueDark),
                    ),
                  ))
            ],
          ),
        ),
        // bottomSheet: const Footer(),
        bottomNavigationBar: Footer());
  }
}

import 'package:calendall_pptu/components/Button/primary.dart';
import 'package:calendall_pptu/components/Footer/primary.dart';
import 'package:calendall_pptu/components/Header/primary.dart';
import 'package:calendall_pptu/components/Input/text.dart';
import 'package:calendall_pptu/pages/forgot_password/recovery_code.dart';
import 'package:calendall_pptu/pages/login.dart';
import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class SendEmailPage extends StatelessWidget {
  SendEmailPage({super.key});

  final emailController = TextEditingController();

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
                  "Para recuperar sua senha, digite seu e-mail cadastrado plataforma. Iremos enviar um código para que a recuperação seja realizada.",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: CustomColors.blueDark),
                  textAlign: TextAlign.center,
                ),
              ),
              InputText(
                controller: emailController,
                name: "E-mail",
                isEnabled: true,
                inputType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: PrimaryButton(
                      text: "Entrar", onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RecoveryCodePage()))
                      }, isEnabled: true)),
              GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
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

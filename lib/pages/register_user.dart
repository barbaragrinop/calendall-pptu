import 'package:frontend/components/Button/primary.dart';
import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Input/password.dart';
import 'package:frontend/components/Input/text.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class RegisterUserPage extends StatelessWidget {
  RegisterUserPage({super.key});

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

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
                margin: const EdgeInsets.only(bottom: 35.0),
                child: const Text(
                  "Cadastro de usuário",
                  style: TextStyle(
                      fontFamily: 'AmaticSC',
                      fontSize: 40,
                      color: CustomColors.blueDark),
                ),
              ),
              InputText(
                controller: nomeController,
                name: "Nome",
                isEnabled: true,
                inputType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              InputText(
                controller: emailController,
                name: "E-mail",
                isEnabled: true,
                inputType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              InputText(
                controller: birthDateController,
                name: "Data de Nascimento",
                isEnabled: true,
                inputType: TextInputType.datetime,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              InputPassword(
                controller: passwordController,
                name: "Senha",
                isEnabled: true,
                inputType: TextInputType.datetime,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              InputPassword(
                controller: confirmationPasswordController,
                name: "Confirmação de Senha",
                isEnabled: true,
                inputType: TextInputType.datetime,
                textCapitalization: TextCapitalization.words,
                hasBorder: true,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 45.0, bottom: 45.0),
                child: const Text(
                  "Deseja sincronizar com algum desses calendários? \nSe sim, clique no ícone do calendário desejado.",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: CustomColors.blueDark),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 45.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon-google.png'),
                    const SizedBox(width: 40.0),
                    Image.asset('assets/images/icon-teams.png'),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: PrimaryButton(
                      text: "Cadastrar",
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage())),
                      isEnabled: true)),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: CustomColors.blueDark),
                    ),
                  )),
            ],
          ),
        ),       
      );
  }
}

import 'package:frontend/components/Button/primary.dart';
import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Input/text.dart';
import 'package:frontend/components/Menu/navigation_bar.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class PersonalDataPage extends StatelessWidget {
  PersonalDataPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(hasReturnIcon: true),
      backgroundColor: CustomColors.white01,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 45.0, bottom: 45.0),
                    child: const Text("Dados pessoais",
                        style: TextStyle(
                            fontFamily: 'AmaticSC',
                            fontSize: 40,
                            color: CustomColors.blueDark))),
                InputText(
                    controller: nameController,
                    name: "Name",
                    isEnabled: true,
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    hasBorder: true),
                InputText(
                    controller: emailController,
                    name: "E-mail",
                    isEnabled: true,
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    hasBorder: true),
                InputText(
                    controller: birthDateController,
                    name: "Data de Nascimento",
                    isEnabled: false,
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    hasBorder: true),
                Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: PrimaryButton(
                        text: "Entrar",
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage())
                              ),
                        isEnabled: true))
              ])),
      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}

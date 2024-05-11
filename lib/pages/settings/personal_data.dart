import 'package:calendall_pptu/components/Button/primary.dart';
import 'package:calendall_pptu/components/Header/primary.dart';
import 'package:calendall_pptu/components/Input/text.dart';
import 'package:calendall_pptu/components/Menu/navigation_bar.dart';
import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class PersonalDataPage extends StatelessWidget {
  PersonalDataPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(hasReturnIcon: false),
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
                    child: const Text("Configurações",
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
                        onPressed: () => {},
                        // onPressed: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PersonalDataPage())
                        //       ),
                        isEnabled: true))
              ])),
      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}

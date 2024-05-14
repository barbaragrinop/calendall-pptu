import 'dart:convert';

import 'package:frontend/components/Button/primary.dart';
import 'package:frontend/components/Input/password.dart';
import 'package:frontend/components/Input/text.dart';
import 'package:frontend/components/LogoText/logo.dart';
import 'package:frontend/models/User/user_login.dart';
import 'package:frontend/pages/forgot_password/send_email.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/register_user.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    String url = "http://localhost:8080/user/login";
    User user = User("", ""); 

    Future save() async {
      
      var response =  await http.post(Uri.parse(url), 
      //prevent cors policy
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'Access-Control-Allow-Origin': '*'},
        body: json.encode({
          'email': user.email,
          'password': user.password
       })
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.blueLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza verticalmente
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
            ),
            const SizedBox(height: 10.0),
            const LogoText(),
            const SizedBox(height: 40.0),
            InputText(
              controller: TextEditingController(text: user.email),
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null; // Return null if the input is valid
              },
              onChanged: (val) {
                if(val != null){
                  user.email = val;
                }
              },
              name: "E-mail",
              isEnabled: true,
              inputType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
              hasBorder: false,
            ),
            InputPassword(
              controller: TextEditingController(text: user.password),
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null; // Return null if the input is valid
              },
              onChanged: (val) {
                if(val != null){
                  user.email = val;
                }
              },
              name: "Password",
              isEnabled: true,
              inputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SendEmailPage()));
              },
              child: Container(
                alignment: Alignment.topRight,
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: CustomColors.primaryGray,
                            offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: CustomColors.primaryGray,
                      decorationThickness: 1),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: PrimaryButton(
                    text: "Entrar",
                    onPressed: () {
                      save();
                      // Navigator.push(context, MaterialPageRoute( builder: (context) => const HomePage())),
                    },
                    isEnabled: true)),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 45.0, bottom: 35.0),
              child: const Text(
                "ou entrar com",
                style: TextStyle(color: CustomColors.primaryGray),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterUserPage()));
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Ainda não é cadastrado? Cadastre-se!",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: CustomColors.primaryGray,
                            offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: CustomColors.primaryGray,
                      decorationThickness: 1),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(
                top: 60.0,
              ),
              child: const Text(
                "Todos os direitos reservados © 2024",
                style: TextStyle(color: CustomColors.primaryGray),
              ),
            ),
          ],
          ),
        ),
      )
    );
  }
}

import 'package:calendall_pptu/components/Header/primary.dart';
import 'package:calendall_pptu/components/Input/text.dart';
import 'package:calendall_pptu/components/Menu/navigation_bar.dart';
import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class SoundNotificationPage extends StatelessWidget {
  SoundNotificationPage({super.key});

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
                    child: const Text("Som e notificação",
                        style: TextStyle(
                            fontFamily: 'AmaticSC',
                            fontSize: 40,
                            color: CustomColors.blueDark))),
                
          ])),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 2,),
    );
  }
}

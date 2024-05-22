import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Input/switch.dart';
import 'package:frontend/components/Menu/navigation_bar.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class SyncCalendarPage extends StatelessWidget {
  SyncCalendarPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(hasReturnIcon: false),
      backgroundColor: CustomColors.white01,
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    child: SizedBox(
                        child: Text("Sincronizar calendário",
                            style: TextStyle(
                                fontFamily: 'AmaticSC',
                                fontSize: 40,
                                color: CustomColors.blueDark)))),
                Row(
                  children: [
                    InputSwitch(),
                    SizedBox(width: 10),
                    Text(
                      "Google",
                      style: TextStyle(
                          fontSize: 16, color: CustomColors.primaryGray),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InputSwitch(),
                    SizedBox(width: 10),
                    Text(
                      "Teams",
                      style: TextStyle(
                          fontSize: 16, color: CustomColors.primaryGray),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ])),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}

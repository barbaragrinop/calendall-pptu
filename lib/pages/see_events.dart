import 'package:flutter/material.dart';
import 'package:frontend/components/Button/secondary.dart';
import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Input/date.dart';
import 'package:frontend/components/Input/select.dart';
import 'package:frontend/components/Input/text.dart';
import 'package:frontend/components/Input/textarea.dart';
import 'package:frontend/components/Menu/navigation_bar.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:intl/intl.dart';

class EventByDayPage extends StatelessWidget {
  EventByDayPage({super.key});

  final currentDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasReturnIcon: true,
      ),
      backgroundColor: CustomColors.white01,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0), // Adjust padding values as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                      child: Column(
                        children: [
                       
                          const SizedBox(height: 20),
                          SecondaryButton(
                              text: "Cadastar Evento",
                              onPressed: () {
                                // save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              },
                              isEnabled: true)
                        ],
                      )),
                ],
              )),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}

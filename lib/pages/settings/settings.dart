import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Menu/navigation_bar.dart';
import 'package:frontend/pages/settings/personal_data.dart';
import 'package:frontend/pages/settings/sound_notification.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(hasReturnIcon: false),
      backgroundColor: CustomColors.white01,
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 45.0, bottom: 25.0),
                child: const Text("Configurações",
                    style: TextStyle(
                        fontFamily: 'AmaticSC',
                        fontSize: 40,
                        color: CustomColors.blueDark))),
            _listItem(Icons.person, "Dados pessoais", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalDataPage()));
            }),
            _listItem(Icons.phone, "Som e notificação", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SoundNotificationPage()));
            }),
            _listItem(Icons.calendar_month, "Calendários sincronizados", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalDataPage()));
            }),
            _listItem(Icons.history, "Histórico de atividades", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalDataPage()));
            }),
            _listItem(Icons.logout, "Sair da Conta", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalDataPage()));
            }),
          ])),
      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}

Widget _listItem(IconData icon, String text, Function onTap) {
  const itemsHeight = 80.0;

  return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: itemsHeight,
        padding: const EdgeInsets.only(left: 45.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey), // Customizable icon
            const SizedBox(width: 20.0), // Add spacing between icon and text
            Text(text),
          ],
        ),
      ));
}

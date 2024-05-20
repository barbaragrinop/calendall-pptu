import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/pages/add_event.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/settings/settings.dart';
import 'package:frontend/util/custom_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
        data: const NavigationBarThemeData(
          labelTextStyle:
              WidgetStatePropertyAll(TextStyle(color: CustomColors.white01)),
          indicatorColor: CustomColors.white01,
        ),
        child: NavigationBar(
          backgroundColor: CustomColors.blueSecondary,

          // Use const for the list of destinations to improve performance
          destinations: [
            NavigationDestination(
              icon: Container(
                child: SvgPicture.asset(
                  'assets/images/icon-add-event.svg',
                  width: 30,
                  height: 30,
                  colorFilter: selectedIndex == 0
                      ? const ColorFilter.mode(
                          CustomColors.blueDark1, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          CustomColors.white01, BlendMode.srcIn),
                ),
              ),
              label: 'Novo Evento',
            ),
            NavigationDestination(
              icon: Icon(Icons.home,
                  color: selectedIndex == 1
                      ? CustomColors.blueDark1
                      : CustomColors.white01),
              label: 'Início',
            ),
            NavigationDestination(
                icon: Icon(Icons.settings,
                    color: selectedIndex == 2
                        ? CustomColors.blueDark1
                        : CustomColors.white01),
                label: 'Config.'),
          ],
          selectedIndex: selectedIndex,

          onDestinationSelected: (int index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => index == 0
                    ? AddEventPage()
                    : index == 1
                        ? const HomePage() // Corrected navigation for Home
                        : const SettingsPage(),
              ),
            );
          },
        ));
  }
}

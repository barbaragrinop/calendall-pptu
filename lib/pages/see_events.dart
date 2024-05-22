import 'package:flutter/material.dart';
import 'package:frontend/components/Button/secondary.dart';
import 'package:frontend/components/EventList/event.dart';
import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Menu/navigation_bar.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:intl/intl.dart';

class EventByDayPage extends StatelessWidget {
  final DateTime? currentDate;

  const EventByDayPage({super.key, this.currentDate});

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
                          Text(
                            "Eventos do dia ${DateFormat('dd/MM/yyyy').format(currentDate!)}",
                            style: const TextStyle(fontSize: 18),
                          ),
                  const SizedBox(height: 15.0),

                          Divider(
                            thickness: 1.0,
                            color: Colors.grey[300],
                            height: 10.0,
                          ),
                  const SizedBox(height: 30.0),

                          ListEventItem(
                              eventName: 'Conseguir um 10 na matéria',
                              eventDate:
                                  DateFormat('dd/MM/yyyy').format(currentDate!),
                              eventId: '1',
                              priority: EventPriority.high),
                          const SizedBox(height: 15.0),
                          ListEventItem(
                              eventName: 'Estudar engenharia',
                              eventDate:
                                  DateFormat('dd/MM/yyyy').format(currentDate!),
                              eventId: '1',
                              priority: EventPriority.medium),
                          const SizedBox(height: 15.0),
                          ListEventItem(
                              eventName: 'Barzinho pós aula',
                              eventDate:
                                  DateFormat('dd/MM/yyyy').format(currentDate!),
                              eventId: '1',
                              priority: EventPriority.low),
                          const SizedBox(height: 15.0),
                          ListEventItem(
                              eventName: 'Terapia',
                              eventDate:
                                  DateFormat('dd/MM/yyyy').format(currentDate!),
                              eventId: '1',
                              priority: EventPriority.high),
                          const SizedBox(height: 15.0),
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

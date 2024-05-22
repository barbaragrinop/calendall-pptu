import 'package:frontend/components/EventList/event.dart';
import 'package:frontend/components/Header/primary.dart';
import 'package:frontend/components/Input/select.dart';
import 'package:frontend/components/Menu/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/add_event.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import this package

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  List<DateTime> eventDates = [];
  List<String> optionsMonths = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  List<String> optionsYears = [
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030'
  ];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR');
    eventDates.add(DateTime(2024, 5, 3));
    eventDates.add(DateTime(2024, 5, 31));
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      today = selectedDay;
    });
    _showPopover(context);
  }

  void _showPopover(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dia: ${DateFormat('dd/MM/yyyy').format(today)}",
                  style: const TextStyle(fontSize: 20)),
              IconButton(
                icon: const Icon(Icons.close, color: CustomColors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 1.0,
                color: Colors.grey[300],
                height: 10.0,
              ),
              ListTile(
                title: const Text("Ver Eventos"),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              Divider(
                thickness: 1.0,
                color: Colors.grey[300],
                height: 10.0,
              ),
              ListTile(
                title: const Text("Cadastrar Eventos"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute( builder: (context) => AddEventPage(propInitialDate: today,)));
                  // Implementação para "Cadastrar Eventos"
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void addEventDate(DateTime date) {
    setState(() {
      if (!eventDates.contains(date)) {
        eventDates.add(date);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasReturnIcon: false,
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
                  const Padding(
                      padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                      child: Text(
                        'Olá, Rosimeire!\nConfira seus próximos compromissos.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey[300],
                    height: 10.0,
                  ),
                  TableCalendar(
                    locale: 'pt_BR',
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    onDaySelected: _onDaySelected,
                    selectedDayPredicate: (day) => isSameDay(today, day),
                    focusedDay: today,
                    firstDay: DateTime.utc(2021, 1, 1),
                    lastDay: DateTime.utc(2025, 12, 31),
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: CustomColors.blueSecondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      // Destaca as datas com eventos na cor laranja
                      markerBuilder: (BuildContext context, DateTime day,
                          List<dynamic> events) {
                        final eventDate = eventDates
                            .where((date) => isSameDay(day, date))
                            .toList();
                        if (eventDate.isNotEmpty) {
                          return Positioned(
                            right: 0,
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border(
                                    top: BorderSide(
                                        color: CustomColors.blueMedium,
                                        width: 2.0),
                                    bottom: BorderSide(
                                        color: CustomColors.blueMedium,
                                        width: 2.0),
                                    left: BorderSide(
                                        color: CustomColors.blueMedium,
                                        width: 2.0),
                                    right: BorderSide(
                                        color: CustomColors.blueMedium,
                                        width: 2.0),
                                  ),
                                ),
                                width: 25, // Ajuste conforme necessário
                                height: 25, // Ajuste conforme necessário
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(
                                      // color: Colors.,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey[300],
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text(
                      'Filtrar',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.blueDark,
                      ),
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: InputSelect(
                        options: optionsMonths,
                        label: 'Mês',
                      ),
                    ),
                    const SizedBox(
                        width:
                            10.0), // Add spacing between widgets (adjust as needed
                    Expanded(
                      child: InputSelect(
                        options: optionsYears,
                        label: 'Ano',
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text(
                      'Eventos de hoje - ${DateFormat('dd/MM/yyyy').format(today)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.blueDark,
                      ),
                    ),
                  ),
                  ListEventItem(
                      eventName: 'Conseguir um 10 na matéria',
                      eventDate: DateFormat('dd/MM/yyyy').format(today),
                      eventId: '1',
                      priority: EventPriority.high),
                  const SizedBox(height: 15.0),
                  ListEventItem(
                      eventName: 'Estudar engenharia',
                      eventDate: DateFormat('dd/MM/yyyy').format(today),
                      eventId: '1',
                      priority: EventPriority.medium),
                  const SizedBox(height: 15.0),
                  ListEventItem(
                      eventName: 'Barzinho pós aula',
                      eventDate: DateFormat('dd/MM/yyyy').format(today),
                      eventId: '1',
                      priority: EventPriority.low),
                  const SizedBox(height: 15.0),
                  ListEventItem(
                      eventName: 'Terapia',
                      eventDate: DateFormat('dd/MM/yyyy').format(today),
                      eventId: '1',
                      priority: EventPriority.high),
                  const SizedBox(height: 15.0),
                ],
              )),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 1,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/components/Button/primary.dart';
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

class AddEventPage extends StatelessWidget {
  final DateTime? propInitialDate;
  
  AddEventPage({super.key, this.propInitialDate});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final priorityController = TextEditingController();
  final notificationStyleController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(propInitialDate != null){
      print("asdasdasd $propInitialDate.toString()");
      startDateController.text = DateFormat('dd/MM/yyyy').format(propInitialDate!);
    }

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
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.0,
                            ),
                            child: Text(
                              'Cadastre um evento',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 25,
                                color: CustomColors.blueDark1,
                              ),
                            ),
                          ),
                          InputText(
                            controller: titleController,
                            name: "Título",
                            isEnabled: true,
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            hasBorder: true,
                          ),
                          InputTextArea(
                            controller: descriptionController,
                            name: "Descrição",
                            isEnabled: true,
                            inputType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            textCapitalization: TextCapitalization.words,
                            hasBorder: true,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InputDate(
                                controller: startDateController,
                                name: "Data de Início",
                                isEnabled: true,
                                hasBorder: true,
                              )),
                              const SizedBox(width: 10),
                              Expanded(
                                child: InputDate(
                                  controller: endDateController,
                                  name: "Data de Término",
                                  isEnabled: true,
                                  hasBorder: true,
                                  onChanged: (String? endDate) {
                                    if (endDate != null &&
                                        startDateController.text.isNotEmpty) {
                                      final startDate =
                                          startDateController.text;
                                      if (endDate.isNotEmpty) {
                                        // Validar o formato da data final
                                        final RegExp dateRegex =
                                            RegExp(r'^\d{2}/\d{2}/\d{4}$');
                                        if (!dateRegex.hasMatch(endDate)) {
                                          // Mostrar mensagem de erro se o formato da data for inválido
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Formato de data inválido. Use o formato DD/MM/YYYY.'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return; // Interromper o processamento se o formato for inválido
                                        }

                                        try {
                                          final initialDate =
                                              DateFormat('dd/MM/yyyy')
                                                  .parse(startDate);

                                          final finalDate =
                                              DateFormat('dd/MM/yyyy')
                                                  .parse(endDate);

                                          if (finalDate.isBefore(initialDate) ||
                                              finalDate
                                                  .isBefore(DateTime.now())) {
                                            // Mostrar mensagem de erro se a data final for anterior à data inicial ou à data de hoje
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'A data final deve ser posterior à data inicial e a data de hoje.'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        } catch (e) {
                                          print(
                                              "Erro ao analisar a data final: $e");
                                          // Tratar erro de análise de data final aqui
                                        }
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          InputSelect(
                            controller: priorityController,
                            label: "Prioridade",
                            options: const ["Alta", "Média", "Baixa"],
                          ),
                          InputSelect(
                            controller: notificationStyleController,
                            label: "Estilo de Notificação",
                           options: const [
                            "A cada dia", 
                            "A cada hora", 
                            "A cada semana", 
                           ],
                          ),
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

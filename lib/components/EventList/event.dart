import 'package:flutter/material.dart';
import 'package:frontend/pages/add_event.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:frontend/util/priorities.dart';
import 'package:intl/intl.dart';


class ListEventItem extends StatelessWidget {
  final String eventName;
  final DateTime eventDate;
  final String eventId;
  final EventPriority priority;
  final bool? isEditing;
  final String? description;

  const ListEventItem(
      {super.key,
      required this.eventName,
      required this.eventDate,
      required this.eventId,
      required this.description,
      required this.priority,
      this.isEditing = false});

  Color getColorEvent(EventPriority priority) {
    switch (priority) {
      case EventPriority.high:
        return CustomColors.red;
      case EventPriority.medium:
        return CustomColors.yellow;
      case EventPriority.low:
        return CustomColors.blueMedium;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(eventDate);

    return Row(
      children: [
        Container(
          width: 15,
          height: 50,
          decoration: BoxDecoration(
            color: getColorEvent(priority),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        eventName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                      const SizedBox(height: 4.0), // Add spacing between texts
                      Text(
                        formattedDate.toString(),
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    if (isEditing == true)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEventPage(
                                      eventId: eventId,
                                      eventName: eventName,
                                      eventDate: eventDate,
                                      description: description,
                                      priority: priority,
                                      isEditing: true,
                                    )))
                      }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      (isEditing != null && isEditing == false)
                          ? Icons.info
                          : Icons.edit,
                      color: (isEditing != null && isEditing == false)
                          ? CustomColors.primaryGray
                          : CustomColors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

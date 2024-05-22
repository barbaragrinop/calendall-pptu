import 'package:flutter/material.dart';
import 'package:frontend/util/custom_colors.dart';

enum EventPriority { low, medium, high }

class ListEventItem extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventId;
  final EventPriority priority;

  const ListEventItem(
      {super.key,
      required this.eventName,
      required this.eventDate,
      required this.eventId,
      required this.priority});

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
                        eventDate,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.info,
                    color: CustomColors.primaryGray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

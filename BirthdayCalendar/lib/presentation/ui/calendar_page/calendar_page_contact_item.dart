import 'package:flutter/material.dart';

/// Selected contact list item class
class CalendarPageContactItem extends StatelessWidget {
  final String phone;

  final String name;

  const CalendarPageContactItem(
      {Key? key, required this.phone, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 2),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.redAccent.shade700),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 80,
            color: Colors.yellow.shade900,
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      phone,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

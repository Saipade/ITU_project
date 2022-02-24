import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';

/// Contact list item class
class ThirdTabBodyItem extends StatelessWidget {
  final int index;

  final String phone;

  final String name;

  final bool isSelected;

  const ThirdTabBodyItem(
      {Key? key,
      required this.index,
      required this.phone,
      required this.name,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var birthdayReminderCubit = context.watch<BirthdayReminderCubit>();

    return Center(
        child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.redAccent.shade700),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.account_circle_outlined,
                    size: 80, color: Colors.yellow.shade900),
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
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ))
                    ],
                  ),
                ),
                ElevatedButton(
                  /// Button for addition/deletion from selected contact list
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90)),
                              side: BorderSide(color: Colors.black))),
                      backgroundColor: MaterialStateProperty.all(
                          isSelected ? Colors.red : Colors.green)),
                  onPressed: () {
                    if (isSelected) {
                      birthdayReminderCubit.deselectContact(index);
                    } else {
                      birthdayReminderCubit.selectContact(index);
                    }
                  },
                  child: Icon(isSelected ? Icons.cancel : Icons.add),
                )
              ],
            )));
  }
}

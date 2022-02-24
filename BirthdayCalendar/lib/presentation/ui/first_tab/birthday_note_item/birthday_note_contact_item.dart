import 'package:flutter/material.dart';

/// Contact subitem for birthday note class
class BirthdayNoteContactItem extends StatelessWidget {
  final String phone;

  final String name;

  final void Function() onCancel;

  const BirthdayNoteContactItem(
      {Key? key,
      required this.name,
      required this.phone,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            child: Text(name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))),
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

                /// Button for deletion from birthday note list
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90)),
                              side: BorderSide(color: Colors.black))),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: onCancel,
                  child: const Icon(Icons.cancel),
                )
              ],
            )));
  }
}

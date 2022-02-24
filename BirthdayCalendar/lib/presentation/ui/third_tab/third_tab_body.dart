import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:hexcolor/hexcolor.dart';

import 'third_tab_body_item.dart';

/// Third tab -- contact list
class ThirdTabBody extends StatelessWidget {
  ThirdTabBody({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var birthdayReminderCubit = context.watch<BirthdayReminderCubit>();
    return Stack(
      children: [
        // Contact list
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [HexColor("#DD2476"), HexColor("#FF512F")],
          )),
          child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: BlocBuilder<BirthdayReminderCubit, BirthdayReminderState>(
                  bloc: birthdayReminderCubit,
                  builder: (context, state) {
                    if (state is BirthdayReminderShow) {
                      var showContacts = state.showContacts;
                      return ListView.builder(
                          itemCount: state.showContacts.length,
                          itemBuilder: (context, index) {
                            return ThirdTabBodyItem(
                              index: index,
                              name: showContacts[index].name,
                              phone: showContacts[index].phone,
                              isSelected: showContacts[index].isSelected,
                            );
                          });
                    } else {
                      return Container();
                    }
                  })),
        ),
        // New contact addition floating button
        Positioned.fill(
            left: size.width * 0.05,
            bottom: size.height * 0.03,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                shape: StadiumBorder(
                    side: BorderSide(
                        color: Colors.redAccent.shade700, width: 0.5)),
                backgroundColor: Colors.yellow.shade900,
                onPressed: () {
                  nameController.clear();
                  phoneController.clear();
                  createAddDialog(context, birthdayReminderCubit);
                },
                child: const Icon(Icons.add),
              ),
            ))
      ],
    );
  }

  /// Pop-up menu on button press
  void createAddDialog(
      BuildContext context, BirthdayReminderCubit birthdayReminderCubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),
        backgroundColor: Colors.yellow.shade900,
        title: const Text(
          'Add new contact',
        ),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Text field to enter the name
              TextField(
                cursorColor: Colors.black,
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent.shade700, width: 1.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.redAccent.shade700, width: 1.0)),
                    hintText: 'Enter new contact name',
                    hoverColor: Colors.redAccent.shade700),
              ),
              const SizedBox(height: 10),

              /// Text field to enter the phone number
              TextField(
                cursorColor: Colors.black,
                controller: phoneController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent.shade700, width: 1.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.redAccent.shade700, width: 1.0)),
                    hintText: 'Enter new contact phone',
                    hoverColor: Colors.redAccent.shade700),
              )
            ]),
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black),
        actions: [
          /// Button to add new item to list
          TextButton(
              onPressed: () {
                birthdayReminderCubit.addContact(
                    nameController.text, phoneController.text);
                Navigator.of(context).pop();
              },
              child: const Text('ADD',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900))),
        ],
      ),
    );
  }
}

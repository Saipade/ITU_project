import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:flutter_mobile_application/presentation/model/birthday_note.dart';
import 'package:flutter_mobile_application/presentation/ui/first_tab/birthday_note_item/birthday_note_contact_item.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Birthday note class
class BirthdayNoteItem extends StatelessWidget {
  final BirthdayNote note;

  const BirthdayNoteItem({Key? key, required this.note}) : super(key: key);

  List<Widget> _buildContactItems(BirthdayReminderCubit cubit) {
    var items = <Widget>[];

    for (var contact in note.contacts) {
      items.add(BirthdayNoteContactItem(
          name: contact.name,
          phone: contact.phone,
          onCancel: () {
            cubit.removeNotedContact(note, contact);
          }));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    var birthdayReminderCubit = context.watch<BirthdayReminderCubit>();

    return Column(
      children: [
        Text(
          DateFormat('dd.MM').format(note.date),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        ..._buildContactItems(birthdayReminderCubit)
      ],
    );
  }
}

import 'package:flutter_mobile_application/presentation/model/contact.dart';

/// Birthday note class. Used as item in birthday notes tab
class BirthdayNote {
  /// Birthday
  final DateTime date;

  /// People born on given date
  final List<Contact> contacts;

  /// Class constructor
  BirthdayNote(this.date, Contact contact) : contacts = [contact];
}

part of 'birthday_reminder_cubit.dart';

abstract class BirthdayReminderState {}

class BirthdayReminderInitialize extends BirthdayReminderState {}

class BirthdayReminderShow extends BirthdayReminderState {
  final List<Contact> showContacts;

  final List<BirthdayNote> notes;

  BirthdayReminderShow(this.showContacts, this.notes);
}

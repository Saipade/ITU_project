part of 'calendar_page_date_picker_cubit.dart';

class CalendarPageDatePickerState {
  final List<DateTime> initialDates;

  final List<Contact> selectedContacts;

  final BirthdayReminderCubit birthdayReminderCubit;

  CalendarPageDatePickerState(
      this.initialDates, this.selectedContacts, this.birthdayReminderCubit);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:flutter_mobile_application/presentation/model/contact.dart';

part 'calendar_page_date_picker_state.dart';

/// Calendar cubit
class CalendarPageDatePickerCubit extends Cubit<CalendarPageDatePickerState> {
  CalendarPageDatePickerCubit(
      List<DateTime> initialDates,
      List<Contact> selectedContacts,
      BirthdayReminderCubit birthdayReminderCubit)
      : super(CalendarPageDatePickerState(
            initialDates, selectedContacts, birthdayReminderCubit));
}

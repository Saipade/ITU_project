import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:flutter_mobile_application/presentation/cubit/calendar_page_cubit/calendar_page_contacts/calendar_page_contacts_cubit.dart';
import 'package:flutter_mobile_application/presentation/cubit/calendar_page_cubit/calendar_page_date_picker/calendar_page_date_picker_cubit.dart';
import 'package:flutter_mobile_application/presentation/model/contact.dart';

part 'calendar_page_cubit_state.dart';

/// Cubit for calendar page
class CalendarPageCubit extends Cubit<CalendarPageState> {
  /// Array of selected contacts
  final List<Contact> _selectedContacts = [];

  final BirthdayReminderCubit _birthdayReminderCubit;

  late final CalendarPageDatePickerCubit _datePickerCubit;

  late final CalendarPageContactsCubit _contactsCubit;

  CalendarPageCubit(BirthdayReminderCubit birthdayReminderCubit)
      : _birthdayReminderCubit = birthdayReminderCubit,
        super(CalendarPageInitialize()) {
    _initialize();
  }

  /// Initilizes list for calendar page
  void _initialize() {
    _selectedContacts.addAll(_birthdayReminderCubit.getSelectedContacts());

    _datePickerCubit = CalendarPageDatePickerCubit(
        _birthdayReminderCubit.getNotedDates(),
        _selectedContacts,
        _birthdayReminderCubit);

    _contactsCubit =
        CalendarPageContactsCubit(CalendarPageContactsState(_selectedContacts));

    emit(CalendarPageShow(_contactsCubit, _datePickerCubit));
  }

  /// Removes top of the stack of selected contacts
  Contact removeLastContact() {
    var contact = _selectedContacts.removeAt(0);

    _contactsCubit.updateSelectedContacts(_selectedContacts);

    return contact;
  }
}

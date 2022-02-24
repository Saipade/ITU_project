import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_application/presentation/model/contact.dart';

part 'calendar_page_contacts_state.dart';

/// Cubit for calendar page list of selected contacts
class CalendarPageContactsCubit extends Cubit<CalendarPageContactsState> {
  CalendarPageContactsCubit(CalendarPageContactsState initialState)
      : super(initialState);

  void updateSelectedContacts(List<Contact> selectedContacts) {
    emit(CalendarPageContactsState(selectedContacts));
  }
}

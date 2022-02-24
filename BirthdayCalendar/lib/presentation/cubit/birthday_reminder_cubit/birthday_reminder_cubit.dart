import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/model/birthday_note.dart';
import 'package:flutter_mobile_application/presentation/model/contact.dart';

part 'birthday_reminder_state.dart';

/// Applcation's main cubit
class BirthdayReminderCubit extends Cubit<BirthdayReminderState> {
  /// Array of contacts (3rd tab)
  late final List<Contact> _contacts;

  /// Array of notes (1st tab)
  List<BirthdayNote> _notes = [];

  /// Cubit initialization
  BirthdayReminderCubit() : super(BirthdayReminderInitialize()) {
    _initialize();
  }

  /// Static contacts on program start
  void _initialize() {
    _contacts = [
      Contact('Gregory', '+420-725-558-605'),
      Contact('Vladislav', '+420-775-558-952'),
      Contact('Kristyna', '+420-702-555-695'),
      Contact('Maxim', '+420-702-595-095'),
      Contact('Mom', '+420-790-555-343'),
      Contact('Ivan', '+420-606-555-676'),
      Contact('Alexander', '+420-725-553-758'),
      Contact('John', '+420-702-555-857'),
      Contact('Ondrea', '+420-725-556-136'),
      Contact('Jan', '+420-735-551-768'),
      Contact('Honza', '+420-702-555-918'),
    ];

    emit(BirthdayReminderShow(_getShowContacts(), _notes));
  }

  /// Adds new custom contact to contacts list (3rd tab)
  void addContact(String name, String phone) {
    var newContact = Contact(name, phone);
    _contacts.add(newContact);
    emit(BirthdayReminderShow(_getShowContacts(), _notes));
  }

  /// Sets selection flag to true, updates application state
  void selectContact(int index) {
    _contacts[index].isSelected = true;

    emit(BirthdayReminderShow(_getShowContacts(), _notes));
  }

  /// Sets selection flag to false, updates application state
  void deselectContact(int index) {
    _contacts[index].isSelected = false;

    emit(BirthdayReminderShow(_getShowContacts(), _notes));
  }

  List<Contact> getSelectedContacts() =>
      _contacts.where((element) => element.isSelected).toList();

  List<DateTime> getNotedDates() =>
      _notes.map<DateTime>((e) => e.date).toList();

  /// Adds new date note or extends other note
  /// (if there is already someone with birthday on the selected date)
  void addNote(DateTime date, Contact contact) {
    if (_notes.where((element) => _isDateEqual(element.date, date)).isEmpty) {
      var note = BirthdayNote(date, contact);

      _addNoteToList(note);

      emit(BirthdayReminderShow(_getShowContacts(), _notes));
    } else {
      var note = _notes.firstWhere((element) => element.date == date);

      note.contacts.add(contact);
    }

    contact.isSelected = false;
    _contacts.remove(contact);
  }

  // addNote subfunction
  void _addNoteToList(BirthdayNote note) {
    _notes.add(note);

    var list = <BirthdayNote>[];

    while (_notes.isNotEmpty) {
      var dateTimeNow = DateTime(0, DateTime.now().month, DateTime.now().day);

      var currentIndex = 0;

      var current = _notes[currentIndex];

      var currentDifference = current.date.difference(dateTimeNow).inDays % 365;

      for (var i = 0; i < _notes.length; i++) {
        var difference = _notes[i].date.difference(dateTimeNow).inDays % 365;

        if (currentDifference > difference && i != 0) {
          currentIndex = i;
        }
      }

      list.add(_notes.removeAt(currentIndex));
    }

    _notes = list;
  }

  /// Checks if dates are equal
  bool _isDateEqual(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  /// Removes contact from the 1st tab (notes) and makes them appear in 3rd tab (contacts)
  void removeNotedContact(BirthdayNote note, Contact contact) {
    if (note.contacts.contains(contact)) {
      note.contacts.remove(contact);

      if (note.contacts.isEmpty) {
        _notes.remove(note);
      }

      _contacts.add(contact);

      emit(BirthdayReminderShow(_getShowContacts(), _notes));
    }
  }

  List<Contact> _getShowContacts() => _contacts.toList();
}

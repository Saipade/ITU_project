part of 'calendar_page_cubit.dart';

abstract class CalendarPageState {}

class CalendarPageInitialize extends CalendarPageState {}

class CalendarPageShow extends CalendarPageState {
  final CalendarPageContactsCubit contactsCubit;

  final CalendarPageDatePickerCubit datePickerCubit;

  CalendarPageShow(this.contactsCubit, this.datePickerCubit);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/calendar_page_cubit/calendar_page_contacts/calendar_page_contacts_cubit.dart';
import 'package:flutter_mobile_application/presentation/cubit/calendar_page_cubit/calendar_page_cubit.dart';
import 'package:flutter_mobile_application/presentation/cubit/calendar_page_cubit/calendar_page_date_picker/calendar_page_date_picker_cubit.dart';
import 'package:flutter_mobile_application/presentation/ui/calendar_page/calendar_page_contact_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:hexcolor/hexcolor.dart';

/// Tab displayed after month selection
class CalendarPage extends StatelessWidget {
  final int monthIndex;

  const CalendarPage({Key? key, required this.monthIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = DateRangePickerController();

    var size = MediaQuery.of(context).size;

    var calendarPageCubit = context.watch<CalendarPageCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#FF512F"),
        foregroundColor: Colors.redAccent.shade700,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [HexColor("#DD2476"), HexColor("#FF512F")],
          )),
          child: BlocBuilder<CalendarPageCubit, CalendarPageState>(
              builder: (context, state) {
            if (state is CalendarPageShow) {
              return Column(
                children: [
                  /// Calendar
                  BlocBuilder<CalendarPageDatePickerCubit,
                          CalendarPageDatePickerState>(
                      bloc: state.datePickerCubit,
                      builder: (context, state) {
                        return Container(
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.redAccent.shade700))),
                          child: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.redAccent.shade700),
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.all(5),
                            child: SfDateRangePicker(
                              allowViewNavigation: false,
                              minDate: DateTime(2021, 1, 1),
                              maxDate: DateTime(2021, 12, 31),
                              monthViewSettings:
                                  const DateRangePickerMonthViewSettings(
                                      firstDayOfWeek: 1,
                                      viewHeaderStyle:
                                          DateRangePickerViewHeaderStyle(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.w900))),
                              monthCellStyle:
                                  const DateRangePickerMonthCellStyle(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                              headerStyle: const DateRangePickerHeaderStyle(
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900)),
                              initialSelectedDates: state.initialDates,
                              selectionMode:
                                  DateRangePickerSelectionMode.multiple,
                              selectionColor: Colors.redAccent.shade700,
                              selectionTextStyle:
                                  const TextStyle(color: Colors.black),
                              todayHighlightColor: Colors.redAccent.shade700,
                              controller: controller,
                              initialDisplayDate:
                                  DateTime(DateTime.now().year, monthIndex),
                              onSelectionChanged: (arguments) {
                                if (state.selectedContacts.isNotEmpty) {
                                  var contact =
                                      calendarPageCubit.removeLastContact();

                                  var dateTime =
                                      (arguments.value as List<DateTime>).last;

                                  state.birthdayReminderCubit
                                      .addNote(dateTime, contact);
                                }
                              },
                            ),
                          ),
                        );
                      }),

                  /// Selected contact list
                  BlocBuilder<CalendarPageContactsCubit,
                          CalendarPageContactsState>(
                      bloc: state.contactsCubit,
                      builder: (context, state) {
                        return Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 7, right: 7),
                          child: ListView.builder(
                              itemCount: state.selectedContacts.length,
                              itemBuilder: (context, index) {
                                var contact = state.selectedContacts[index];

                                return CalendarPageContactItem(
                                    phone: contact.phone, name: contact.name);
                              }),
                        ));
                      })
                ],
              );
            } else {
              return Container();
            }
          })),
    );
  }
}

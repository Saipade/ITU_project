import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:flutter_mobile_application/presentation/cubit/calendar_page_cubit/calendar_page_cubit.dart';
import 'package:flutter_mobile_application/presentation/ui/calendar_page/calendar_page.dart';

/// Month button class
class MonthButton extends StatelessWidget {
  final String name;

  final int monthIndex;

  const MonthButton({Key? key, required this.name, required this.monthIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var birthdayReminderCubit = context.watch<BirthdayReminderCubit>();

    /// redirection to selected month on calendar page
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider<CalendarPageCubit>(
                create: (context) => CalendarPageCubit(birthdayReminderCubit),
                child: CalendarPage(monthIndex: monthIndex))));
      },

      /// button
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                width: 2, color: Colors.redAccent.shade700.withOpacity(0.6))),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
        )),
      ),
    );
  }
}

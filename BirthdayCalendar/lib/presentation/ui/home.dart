import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:flutter_mobile_application/presentation/ui/first_tab/first_tab_body.dart';
import 'package:flutter_mobile_application/presentation/ui/third_tab/third_tab_body.dart';
import 'second_tab/second_tab_body.dart';
import 'package:hexcolor/hexcolor.dart';

/// Home interface
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 2,
        length: 3,
        child: Scaffold(
            backgroundColor: HexColor("#FF512F"),
            body: BlocProvider<BirthdayReminderCubit>(
              create: (context) => BirthdayReminderCubit(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: TabBar(
                        indicatorColor: Colors.redAccent.shade700,
                        labelColor: Colors.redAccent.shade700,
                        tabs: const [
                          Tab(icon: Icon(Icons.list)),
                          Tab(icon: Icon(Icons.calendar_today)),
                          Tab(icon: Icon(Icons.contact_phone))
                        ]),
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    const FirstTabBody(),
                    SecondTabBody(),
                    ThirdTabBody()
                  ]))
                ],
              ),
            )),
      ),
    );
  }
}

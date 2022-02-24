import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/presentation/cubit/birthday_reminder_cubit/birthday_reminder_cubit.dart';
import 'package:flutter_mobile_application/presentation/model/birthday_note.dart';
import 'package:flutter_mobile_application/presentation/ui/first_tab/birthday_note_item/birthday_note_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

/// First tab -- birthday note list
class FirstTabBody extends StatelessWidget {
  const FirstTabBody({Key? key}) : super(key: key);

  List<Widget> _buildColumn(List<BirthdayNote> notes) {
    var widgets = <Widget>[];

    for (var note in notes) {
      widgets.add(BirthdayNoteItem(note: note));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Scaffold(

          /// Header
          appBar: AppBar(
              toolbarHeight: 20,
              backgroundColor: HexColor("#FF512F"),
              centerTitle: true,
              elevation: 0.0,
              bottomOpacity: 0.0,
              title: const Padding(
                padding: EdgeInsets.only(bottom: 7),
                child: Text(
                  'Upcomming birthdays',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              )),

          /// Birthday note list
          body: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [HexColor("#DD2476"), HexColor("#FF512F")],
              )),
              child: BlocBuilder<BirthdayReminderCubit, BirthdayReminderState>(
                builder: (context, state) {
                  if (state is BirthdayReminderShow) {
                    return SingleChildScrollView(
                      child: Column(
                        children: _buildColumn(state.notes),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ))),
    );
  }
}

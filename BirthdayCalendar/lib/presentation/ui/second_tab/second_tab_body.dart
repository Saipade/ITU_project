import 'package:flutter/material.dart';
import 'month_box.dart';
import 'package:hexcolor/hexcolor.dart';

/// Second tab -- month selection
class SecondTabBody extends StatelessWidget {
  SecondTabBody({Key? key}) : super(key: key);

  final List<String> _months = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];

  /// 4x3 month array
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [HexColor("#DD2476"), HexColor("#FF512F")],
      )),
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[0],
                        monthIndex: 1,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[1],
                        monthIndex: 2,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[2],
                        monthIndex: 3,
                      )),
                ],
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[3],
                        monthIndex: 4,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[4],
                        monthIndex: 5,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[5],
                        monthIndex: 6,
                      )),
                ],
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[6],
                        monthIndex: 7,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[7],
                        monthIndex: 8,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[8],
                        monthIndex: 9,
                      )),
                ],
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[9],
                        monthIndex: 10,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[10],
                        monthIndex: 11,
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MonthButton(
                        name: _months[11],
                        monthIndex: 12,
                      )),
                ],
              )),
        ],
      ),
    );
  }
}

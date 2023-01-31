import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/text_strings.dart';

class TrimesterCalendar extends StatelessWidget {
  const TrimesterCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trimester Calender'),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(uuid)
                .collection('info')
                .doc('user')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              var data = snapshot.data;
              Timestamp timestamp = data!['lastPeriod'];
              DateTime dateTime = timestamp.toDate();
              DateTime newTime = dateTime.add(const Duration(days: 280));
              var formatter = DateFormat('dd-MM-yyyy');

              String dueDate = formatter.format(newTime);

              var startDate = dateTime;
              var endDate = dateTime.add(const Duration(days: 280));
              var trimester1Start = startDate;
              var trimester1End = startDate.add(const Duration(days: 12 * 7));
              var trimester2Start = trimester1End;
              var trimester2End =
                  trimester2Start.add(const Duration(days: 14 * 7));
              var trimester3Start = trimester2End;
              var trimester3End = endDate;

              return SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Due date: $dueDate',
                        textScaleFactor: 1.2,
                      ),
                      calendar('First Trimester', trimester1Start,
                          trimester1End, trimester1Start),
                      calendar('Second Trimester', trimester2Start,
                          trimester2End, trimester2Start),
                      calendar('Third Trimester', trimester3Start,
                          trimester3End, trimester3Start),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  Column calendar(
      String trimester, DateTime start, DateTime end, DateTime focuseday) {
    return Column(
      children: [
        Text(
          trimester,
          textScaleFactor: 2,
        ),
        TableCalendar(
          
          firstDay: start,
          lastDay: end,
          focusedDay: focuseday,
          rangeStartDay: start,
          rangeEndDay: end,
          startingDayOfWeek: StartingDayOfWeek.saturday,
        ),
      ],
    );
  }
}

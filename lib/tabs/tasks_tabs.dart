import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
  initialDate: DateTime.now(),
  firstDate: DateTime.now().subtract(Duration(days: 700)),
  lastDate: DateTime.now().add(Duration(days: 700)),
  onDateSelected: (date) => print(date),
  leftMargin: 20,
  monthColor: AppColor.gray,
  dayColor:   AppColor.primary,
  activeDayColor: Colors.white,
  activeBackgroundDayColor: AppColor.primary,
 dotColor: Colors.white,
  //selectableDayPredicate: (date) => date.day != 23,
  locale: 'en',
)
      ],
    );
  }
}
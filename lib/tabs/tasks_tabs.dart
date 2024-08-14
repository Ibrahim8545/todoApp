import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/widget/task_item.dart';

class TasksTab extends StatelessWidget {
 TasksTab({super.key});
DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(Duration(days: 700)),
          lastDate: DateTime.now().add(Duration(days: 700)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: AppColor.gray,
          dayColor: AppColor.primary,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: AppColor.primary,
          dotColor: Colors.white,
          //selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
        const SizedBox(
          height: 24,
        ),
        StreamBuilder(
          stream: FirebaseFunctions.getTask(),
         
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return CircularProgressIndicator();
            }
            else if(snapshot.hasError)
            {
              Column(
                children: [
                  Text('Somethings Error'),
                  ElevatedButton(onPressed: (){}, child: Text('try aggain')),
                ],
              );

            }

          var tasks= snapshot.data?.docs.map((e) => e.data()).toList();
          if(tasks?.isEmpty ?? true)
          {
            return const  Center(
              child: Text(
                'No tasks today'),
                );
          }  
          return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemCount: tasks!.length,
            itemBuilder: (context, index) {
              return  TaskItem(taskModel: tasks[index],);
            },
          ),
        );

          },
          ),



        
      ],
    );
  }
}

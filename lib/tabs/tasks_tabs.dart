import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/widget/task_item.dart';

class TasksTab extends StatefulWidget {
 TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: date,
            firstDate: DateTime.now().subtract(Duration(days: 700)),
            lastDate: DateTime.now().add(Duration(days: 700)),
               onDateSelected:(dateTime) {
              date=dateTime;
              setState(() {
                
              });
            },
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
            stream: FirebaseFunctions.getTask(date),
           
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
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/images/meme-patrick-star.gif',
                height: 240,
                width: 300,
                ),
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
      ),
    );
  }
}

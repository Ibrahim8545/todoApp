import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/widget/edit_task.dart';

class TaskItem extends StatelessWidget {
  TaskItem({super.key,required this.taskModel});
  TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion:const  DrawerMotion(),
          extentRatio: .6,
          children: [
            SlidableAction(
              onPressed: (context) 
              {
                FirebaseFunctions.deleteTasks(taskModel.id);
              },
              label: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete,
              spacing: 8,
              padding: EdgeInsets.zero,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            SlidableAction(
              onPressed: (context) 
              {
                Navigator.pushNamed(context, EditTask.routeName, arguments: taskModel);
              },
              label: "Edit",
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              spacing: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 3,
                decoration: BoxDecoration(
                  color:taskModel.isDone?Colors.green: AppColor.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      style: TextStyle(
                        fontSize: 18,
                         color:taskModel.isDone?Colors.green: AppColor.primary),
                    ),
                  Text(
                      taskModel.subTitle,
                      style: TextStyle(
                        fontSize: 14, 
                        color:taskModel.isDone?Colors.green: AppColor.gray),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              taskModel.isDone?const Text('Done!',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30 
              ),):
              ElevatedButton(
                onPressed: () {
                  taskModel.isDone=true;
                FirebaseFunctions.updateStatus(taskModel);

                },
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

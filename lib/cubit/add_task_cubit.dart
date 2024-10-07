import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/cubit/add_task_state.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/models/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  void selectDate(DateTime date) {
    selectedDate = date;
    emit(TaskDateSelected(date));
  }

  void addTask() {
    TaskModel task = TaskModel(
      title: titleController.text,
      userId: FirebaseAuth.instance.currentUser!.uid,
      subTitle: subTitleController.text,
      date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
    );

    // Add the task using your Firebase function
    FirebaseFunctions.addTask(task);
    emit(TaskAdded());
  }
}



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/cubit/add_task_cubit.dart';
import 'package:todoapp/cubit/add_task_state.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/providers/theme_provider.dart';


class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var proTheme = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            if (state is TaskAdded) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            final cubit = context.read<TaskCubit>();

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Text(
                  'Add New Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25, 
                    fontWeight: FontWeight.bold,
                    color: proTheme.appTheme == ThemeMode.light?
                    AppColor.dark : AppColor.primary
                   
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: cubit.titleController,
                  decoration: InputDecoration(
                    label: Text(
                      'Title',
                      style: TextStyle(
                        color: proTheme.appTheme == ThemeMode.light?
                    AppColor.dark : AppColor.primary
                    )
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    )
                  ),
                   style: TextStyle(
        color:proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
      ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: cubit.subTitleController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    label:  Text(
                      'Description',
                      style: TextStyle(
                        color: proTheme.appTheme == ThemeMode.light?
                    AppColor.dark : AppColor.primary
                      ),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                   style: TextStyle(
        color:proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
      ),
                ),
                const SizedBox(height: 18),
                 Text(
                  'Select time',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400,
                    color: proTheme.appTheme == ThemeMode.light?
                    AppColor.dark : AppColor.primary
                    ),
                ),
                const SizedBox(height: 18),
                InkWell(
                  borderRadius: BorderRadius.circular(18),
              

                  onTap: () async {
                    DateTime? chosenDate = await showDatePicker(
                      context: context,
                      builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme:proTheme.appTheme == ThemeMode.light?
                            const ColorScheme.light(
                            primary: AppColor.primary,
                            onPrimary: Colors.white,
                            onSurface: AppColor.dark,
                          ):const ColorScheme.dark(
                            primary: AppColor.primary,
                            onPrimary: Colors.white,
                            onSurface: Colors.white),
                          
                          

                        ),
                        child: child!,
                      ),
                      initialDate: cubit.selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (chosenDate != null) {
                      cubit.selectDate(chosenDate);
                    }
                  },
                  child: Text(
                    cubit.selectedDate.toString().substring(0, 10),
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400,
                      color: proTheme.appTheme == ThemeMode.light?
                      AppColor.dark : AppColor.primary
                      ),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    cubit.addTask();
                  },
                  child: Text(
                    'Add Task',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: proTheme.appTheme != ThemeMode.light?
                    AppColor.primary:
                    AppColor.dark,
                    shape: const StadiumBorder(),
                    ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

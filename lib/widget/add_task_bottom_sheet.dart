import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
 DateTime selectedDate=DateTime.now();
 var titleController=TextEditingController();
var subTitleController=TextEditingController();

 
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                
                label:const  Text('Title'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18))),
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: subTitleController,
            decoration: InputDecoration(
              
                hintMaxLines: 5,
                label:  Text('Description'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18))),
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Select time',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 18,
          ),
           InkWell(
             onTap: ()
             {
              selectDateFun();
              
             },
             child:  Text(
              selectedDate.toString().substring(0,10),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                       ),
           ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () 
            {
             TaskModel task=TaskModel(
              title: titleController.text,
               subTitle: subTitleController.text,
                date:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch
                );
                FirebaseFunctions.addTask(task).then((value)
                {
                  Navigator.pop(context);
                },);
                  
                

            },
            child: Text(
              'Add Task',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
          ),
        ],
      ),
    );
  }

  selectDateFun()async
  {
   DateTime ? choosenDate=await showDatePicker(
      context: context, 
      builder:(context, child) =>  Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primary, 
              onPrimary: Colors.white, 
              onSurface: Colors.black, 
            ),
            ),
            child:child! ,
            ) ,
      initialDate: selectedDate,
      firstDate: DateTime.now(), 
      lastDate: DateTime.now().add(const Duration(days:  365),
      )
     
      );
      if(choosenDate!=null)
      {
        selectedDate=choosenDate;
        setState(() {
          
        });
      }
  }
}

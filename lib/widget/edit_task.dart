import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:intl/intl.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});
  static const routeName = 'edit-task';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as TaskModel;
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Edit Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                const Spacer(),
              TextFormField(
                initialValue: model.title,
                onChanged: (value) {
                 model.title=value; 
                },
                decoration: InputDecoration(
                  label: const Text('Title'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              const Spacer(),
              TextFormField(
                initialValue: model.subTitle,
                onChanged: (value) {
                 model.subTitle=value;
                },
                   maxLines: 2,
                decoration: InputDecoration(
                  label: const Text('Description'),
               
               
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                     borderSide: BorderSide(color: Colors.green),
                     ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                   
                  ),
                ),
              ),
              
              const Spacer(),
             InkWell(
              onTap: ()async
              {
                DateTime? newDate=await selectDateFun();
                if(newDate!=null)
                {
                  model.date=newDate.millisecondsSinceEpoch;
                  setState(() {
                    
                  });
                }


              },
               child: const Align(
                  alignment: Alignment.topLeft,
                  child:  Text(
                    'Selected Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                      ),
                  ),
                ),
             ),
              const Spacer(),
            Text(
              DateFormat.yMd().format( DateUtils.dateOnly(
                DateTime.fromMillisecondsSinceEpoch(model.date ?? 0)
              )),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                       ),
           
              const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 60)
                  ),
                  onPressed: ()
                  {
                    FirebaseFunctions.updateStatus( model).then((value) => Navigator.pop(context));
                    
                  },
                 child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                    ),
                  ),
                 ),
                const Spacer(flex: 5,),
            ]),
          ),
        ),
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
      return choosenDate;
  }
}

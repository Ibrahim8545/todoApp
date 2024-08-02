import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/app_color.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        extentRatio: .4,
        children: [
          SlidableAction(onPressed:(context) {
            
          },
          label: "Delete",
          backgroundColor: Colors.red,
          icon: Icons.delete,
          spacing: 8,
          ),
 SlidableAction(onPressed:(context) {
            
          },
          label: "Edit",
          backgroundColor: Colors.blue,
          icon: Icons.edit,
          spacing: 8,
          ),

        ],
       
        ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 3,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(18),
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
                    'I am ibrahim',
                    style: TextStyle(fontSize: 18, color: AppColor.primary),
                  ),
                  const Text(
                    'i dead inside and outside',
                    style: TextStyle(fontSize: 14, color: AppColor.gray),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
              onPressed: () {},
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
    );
  }
}

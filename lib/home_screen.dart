import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/tabs/settings_tab.dart';
import 'package:todoapp/tabs/tasks_tabs.dart';
import 'package:todoapp/widget/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text(
          'Todo App',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () 
        {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
             builder:(context) => Padding(
               padding:  EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
               ),
               child:const  AddTaskBottomSheet(),
             ),
             );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: const BorderSide(color: Colors.white, width: 4)),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.gray,
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting'),
            ]),
      ),
      body: tabs[selectedIndex]
    );
  }
  List<Widget>tabs=[
    const TasksTab(),
    const SettingsTab()
  ];
}

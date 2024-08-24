import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/modals_bottom.dart/language_modal_bottom.dart';
import 'package:todoapp/modals_bottom.dart/thwmw_modal_bottom.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text(
          'Settings',
          style: TextStyle
          (color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
          ),
          ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: AppColor.secondary,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            const Text(
            'Language',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                 builder: (context){
                  return LanguageModalBottom();
                 }
                 );
              },
              child: Container(
                padding:const  EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColor.primary)),
                child: Text(  
               'English',
        
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(height: 25,),
            const Text(
            'Theme',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                 builder: (context){
                  return ThemeModalBottom();
                 }
                 );
              },
              child: Container(
                padding:const  EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColor.primary)),
                child: Text(  
               'Light',
               
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ]
        ),
      ),

    );
  }
}
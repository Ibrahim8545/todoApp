import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';


class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        
        
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'ElMessiri',
            color: Colors.black),
      ),
     
      iconTheme: IconThemeData(color: AppColor.primary),
      
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColor.primary,
        type: BottomNavigationBarType.fixed,
      ),

  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(size: 30,color: Colors.white),
        elevation: 0,
 
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'ElMessiri',
            color: Colors.white),
      ),
      
      iconTheme:  IconThemeData(color: AppColor.primary),
      
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.dark,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColor.dark,
        type: BottomNavigationBarType.fixed,
      ),

   
      
  );
}

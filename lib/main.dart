import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/providers/my_provider_auth.dart';
import 'package:todoapp/providers/theme_provider.dart';
import 'package:todoapp/signin_and_sigup/login.dart';
import 'package:todoapp/signin_and_sigup/regsiter.dart';
import 'package:todoapp/splash_screen.dart';
import 'package:todoapp/themes.dart';
import 'package:todoapp/widget/edit_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers:[
         ChangeNotifierProvider(
          create:(context)=> ThemeProvider()
          ),
         ChangeNotifierProvider(
        create: (context) => MyProvider(),
         ),
        
      ],
          child: const MyApp(),
      ),
    
  
  
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: pro.appTheme ,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      home: const SplashScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        SignupScreen.routeName: (context) => SignupScreen(),
        EditTask.routeName: (context) =>const  EditTask(),
      },
    );
  }
}

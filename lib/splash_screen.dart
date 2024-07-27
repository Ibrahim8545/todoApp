import 'package:flutter/material.dart';




import 'package:todoapp/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName='splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      (){
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);

      }

      );
  }
  @override
  Widget build(BuildContext context) {
 
    return  Container(
      color:
       Color(0xffFFFFFF)
      
       ,
      child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                
                height: 211,
               
                ),
            ),
            const Spacer()
          ]
          ),
    );
  }
}
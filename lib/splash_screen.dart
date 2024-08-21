import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/home_screen.dart';
import 'package:todoapp/providers/my_provider_auth.dart';
import 'package:todoapp/signin_and_sigup/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String routeName = 'splash';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          var pro = Provider.of<MyProvider>(context, listen: false);
          if (pro.firebaseUser != null) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffDFECDB),
      child: Column(
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 211,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

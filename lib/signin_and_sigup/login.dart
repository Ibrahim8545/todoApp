import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/signin_and_sigup/custom_button.dart';
import 'package:todoapp/signin_and_sigup/custom_text_field.dart';
import 'package:todoapp/signin_and_sigup/regsiter.dart';

class LoginPage extends StatelessWidget {
  static  const  routeName = 'LoginPage';
var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ToDo',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'pacifico'),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              const Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hint: 'Email',
                text: 'Email must be not empty',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hint: 'Password',
                text: 'Pasword must be not empty',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () 
                 {
                  FirebaseFunctions.login(emailController.text, passwordController.text);
                  // Navigator.pushNamed(context,HomeScreen.routeName);
                 },
                text: 'LOGIN',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don\'t have an account ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () 
                    {
                      Navigator.pushNamed(context, RegsiterPage.routeName);
                    },
                    child: const Text(
                      'Resister',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

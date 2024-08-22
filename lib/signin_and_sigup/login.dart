import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/providers/my_provider_auth.dart';
import 'package:todoapp/signin_and_sigup/custom_button.dart';
import 'package:todoapp/signin_and_sigup/custom_text_field.dart';

import 'package:todoapp/signin_and_sigup/regsiter.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
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
                    'ToDo App',
                    style: TextStyle(
                        fontSize: 32,
                        color:  Colors.white,
                        fontFamily: 'pacifico'),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
             const  Row(
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
                text: 'Password must be not empty',
                 obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap:  () {
                    if(formKey.currentState!.validate())
                    {
                      FirebaseFunctions.login(
                        emailAddress: emailController.text,
                        password: passwordController.text,
                        onSucess: () {
                          pro.initUser();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                            (route) => false,
                          );
                        },
                        onError: (error) {
                          {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: const Text('Error'),
                                      title: Text(error),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('okay'))
                                      ],
                                    ));
                          }
                        });
                    }
                  },
                 text: 'Login'),
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
                    onTap: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                    child: const Text(
                      'Resister',
                     style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Colors.white),
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

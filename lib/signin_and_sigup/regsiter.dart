

import 'package:flutter/material.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';

import 'package:todoapp/signin_and_sigup/custom_text_field.dart';
import 'package:todoapp/signin_and_sigup/login.dart';


class RegsiterPage extends StatelessWidget {
  
  static  const String routeName = 'RegsiterPage';
 var emailController=TextEditingController();
var passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                      'assets/images/images.jpg',
                      height: 100,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Scholar Chat',
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
                          'REGSITER',
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
                      text: 'Email must be not empty',
                    
                      hint: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      text: 'Pasword must be not empty',
                      hint: 'Password',
                    ),
                    const SizedBox(height: 20),
                   ElevatedButton(
                    onPressed: ()
                    {
                      FirebaseFunctions.creatAccount(
                        emailController.text, 
                        passwordController.text,
                        onSucess: (){
                          Navigator.pushReplacementNamed(context, LoginPage.routeName);
                          SnackBar(content: build(context));
                        },
                        onError: (message)
                        {
                          showDialog(context: context,
                           builder:(context) => AlertDialog(
                            content:const  Text('message'),
                            title: Text('Error'),
                            actions: [
                              ElevatedButton(
                                onPressed: (){},
                                 child: Text('okay'))
                            ],


                           )
                           );
                        }
                        );
                      print('email add');
                    },
                     child: Text('Register')),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have an account ?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
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


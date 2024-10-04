import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/firebase_function/firebase_function.dart';
import 'package:todoapp/providers/theme_provider.dart';
import 'package:todoapp/signin_and_sigup/custom_button.dart';
import 'package:todoapp/signin_and_sigup/custom_text_field.dart';
import 'package:todoapp/signin_and_sigup/login.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "signUp";

  SignupScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
        var proTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: proTheme.appTheme ==
       ThemeMode.light?
        AppColor.secondary :
       AppColor.dark,
      resizeToAvoidBottomInset: false,
   
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
             LoginPage.routeName,
           (route) => false, 
           );
        },
        child:   Padding(
          padding: EdgeInsets.all(18.0),
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                TextSpan(
                  text: "I have an Account? ",
                  style: TextStyle
                  (fontSize: 14, 
                  color: proTheme.appTheme == ThemeMode.light?
                      AppColor.dark.withOpacity(0.7) : Colors.white
                  ),
                  ),
                TextSpan(
                    text: "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:proTheme.appTheme == ThemeMode.light?
                      AppColor.dark : Colors.white),
                        ),
              ])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Text(
                  'SignUp',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: proTheme.appTheme == ThemeMode.light?
                      AppColor.dark : Colors.white
                      ,
                    ),
                ),
                const SizedBox(height: 16),const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  hint: 'Email',
                  text: 'Email must be not empty',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: userNameController,
                  hint: 'UserName',
                  text: 'UserName must be not empty',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: phoneController,
                  hint: 'Phone',
                  text: 'Phone must be not empty',
                  keyboardType: TextInputType.phone,

                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: ageController,
                  hint: 'Age',
                  text: 'Age must be not empty',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  hint: 'Password',
                  text: 'Password must be not empty',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
               CustomButton(
                onTap:()
                 {
                     
                    if (formkey.currentState!.validate()) {
                      FirebaseFunctions.createAccount(
                          emailController.text, passwordController.text,
                          age: int.parse(ageController.text),
                          phone: phoneController.text,
                          userName: userNameController.text, onSucess: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      }, onError: (error) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Error"),
                            content: Text(error),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cacnel"),
                                 
                                  ),
                            ],
                          ),
                        );
                      });
                    }
                  },
                 text: 'Register',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
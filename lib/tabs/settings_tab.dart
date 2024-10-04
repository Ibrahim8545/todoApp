import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/modals_bottom.dart/thwmw_modal_bottom.dart';
import 'package:todoapp/providers/theme_provider.dart';
import 'package:todoapp/signin_and_sigup/custom_button.dart';
import 'package:todoapp/signin_and_sigup/login.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: pro.appTheme == ThemeMode.light
            ? AppColor.secondary
            : AppColor.dark,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'Theme',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:
                  pro.appTheme == ThemeMode.light ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: pro.appTheme == ThemeMode.light
                      ? Colors.white
                      : AppColor.dark,
                  context: context,
                  builder: (context) {
                    return const  ThemeModalBottom();
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: pro.appTheme == ThemeMode.light
                      ? Colors.white
                      : AppColor.dark,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.primary)),
              child: Text(
                pro.appTheme == ThemeMode.light ? 'light' : 'dark',
                style: TextStyle(
                  fontSize: 20,
                  color: pro.appTheme == ThemeMode.light
                      ? Colors.black
                      : AppColor.primary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 25,
          ),
          CustomButton(
            
              onTap: () {
                showDialog(

                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Text('Log Out of your account?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child:const  Text('Cancel',
                                style: TextStyle(color: Colors.black),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LoginPage.routeName,
                                    (route) => false,
                                  );
                                },
                                child:const  Text(
                                  'Log Out',
                                  style: TextStyle(color: Colors.red),
                                  )
                                ),
                          ],
                        ));
              },
              text: (
                'Log out'
  
                ),
              
              ),
        ]),
      ),
    );
  }
}

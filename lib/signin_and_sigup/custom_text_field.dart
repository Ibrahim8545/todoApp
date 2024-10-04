import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hint,
      this.text,
      this.obscureText = false,
      this.controller,
      this.keyboardType});

  String? hint;
  String? text;
  bool? obscureText;
  TextEditingController? controller;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    var proTheme = Provider.of<ThemeProvider>(context);
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return (text);
        }
      },
      decoration: InputDecoration(
        label: Text(
          '$hint',
        ),
        labelStyle: TextStyle(
          color: proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
       fontSize: 16.0),
        border:  OutlineInputBorder(
          borderSide: BorderSide(
            color: proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
            ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color:proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
            ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color:proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
            ),
        ),
      ),
      style: TextStyle(
        color:proTheme.appTheme == ThemeMode.light?
        Colors.black:
        Colors.white,
      ),
    );
  }
}

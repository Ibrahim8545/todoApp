import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/providers/theme_provider.dart';

class CustomButton extends StatelessWidget {
 CustomButton({super.key,required this.onTap,required this.text});
String text;
 VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: pro.appTheme==ThemeMode.light?
                Colors.yellow:
                AppColor.gray
              ),
              width: double.infinity,
              height: 60,
              child:Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  )
                  )
                ) ,
            ),
    );
  }
}
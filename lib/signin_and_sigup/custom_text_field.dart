import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.hint,this.text,this.obscureText=false,this.controller});

String? hint;
String? text;
bool? obscureText;
TextEditingController? controller;



  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText!,
      controller: controller,
      validator: (value) 
      {
        if(value!.isEmpty)
        {
          return(text);
        }
      },

            decoration: InputDecoration(
            
            label: Text(
              '$hint',
              style:const  TextStyle(
                color: Colors.white
              ),
              ),
              // border: const OutlineInputBorder(
              //   Colors.amber,
              //   borderSide: BorderSide(
              //     color: Colors.white
              //     ),
              // ),

            
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                  ),
              ),
            ),
          );
  }
}
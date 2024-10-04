import 'package:flutter/material.dart';

class LanguageModalBottom extends StatelessWidget {
  const LanguageModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container( 
      decoration:const BoxDecoration(
         color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        )
      ),
   
      padding:const  EdgeInsets.all(18),
      
        
      child: Column(
        mainAxisSize: MainAxisSize.min,
      
        children: [
          InkWell(
            onTap: () {
              //pro.changeLanguage(context,'en');
              
            },
            child: Row(
              children: [
                Text(
                  'english',
                  // style: Theme.of(context).
                  // textTheme.
                  // bodyMedium?.
                  // copyWith(
                  //   color:currentLocale==Locale('en')?
                  //    AppColor.primaryColor:AppColor.blackColor
                  // ),
                  ),
                const Spacer(),
               
                Icon(Icons.done,size: 35,),
              ],
            ),
          ),

          const SizedBox(height: 30,),

          InkWell(
            onTap: () {
        
                //pro.changeLanguage(context,'ar');
            },
            child:const  Row(
              children: [
                Text(
                  'arabic',
                  ),
                const Spacer(),
                            
                Icon(Icons.done,size: 35,)
              ],
            ),
          ),
          
                 
          
        ],
      ),
    );;
  }
}
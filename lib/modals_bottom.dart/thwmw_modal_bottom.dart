import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_color.dart';
import 'package:todoapp/providers/theme_provider.dart';

class ThemeModalBottom extends StatelessWidget {
  const ThemeModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return Container(
      decoration:  BoxDecoration(
          color: pro.appTheme==ThemeMode.light?
          Colors.white:
          AppColor.dark,

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  'Light',
                 style: TextStyle(
                   color: pro.appTheme==ThemeMode.light?
                   AppColor.primary:
                   Colors.white,
                     fontSize: 20
                 ),
                 
                ),
                const Spacer(),
pro.appTheme==ThemeMode.light?
                Icon(
                  Icons.done,
                  size: 35,
                ):SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  'Dark',
                 style: TextStyle(
                   color: pro.appTheme!=ThemeMode.light?
                   AppColor.primary:
                   Colors.black,
                   fontSize: 20
                 ),
                ),
                const Spacer(),
                pro.appTheme!=ThemeMode.light?
                Icon(
                  Icons.done,
                  size: 35,
                ):SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

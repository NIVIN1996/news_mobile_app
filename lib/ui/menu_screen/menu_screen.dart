import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(

        padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
             curve: Curves.easeIn,
            decoration: const BoxDecoration(
              color: AppColor.yellow,
            ),
            child: Text('News4U',style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 24)),
          ),

          ListTile(
            title:  Text('Profile Settings',style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 20)),
            onTap: () {

            },
          ),

          ListTile(
            title:  Text('Dark Mode',style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 20)),
            onTap: () {

            },
          ),
          ListTile(
            title:  Text('Terms and Conditions',style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 20)),
            onTap: () {

            },
          ),
          ListTile(
            title:  Text('Rate Us',style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 20)),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}

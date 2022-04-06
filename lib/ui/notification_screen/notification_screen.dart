import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/widgets/app_bar_widget/common_app_bar_widget.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        label: "",
        showNotification: false,
        backPress: () {
          Navigator.pop(context);
        },
        appBar: AppBar(),
      ),
      body: Center(
        child: Text(
          "No Notification Available",
          textAlign: TextAlign.center,
          style: TextFontStyle.med(size: context.textPx * 20, color: AppColor.red),
        ),
      ),
    );
  }
}

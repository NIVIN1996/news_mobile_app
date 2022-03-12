import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';

import '../../services/navigator/routes.dart';
import '../../widgets/app_bar_widget/common_app_bar_widget.dart';
import 'notification_widget/notification_widget.dart';

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
        showFilter: false,
        label: "",
        showNotification: false,

        backPress: () {
          Navigator.pop(context);
        },
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NotificationWidget()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../utils/text_style/text_style.dart';
import '../../widgets/app_bar_widget/common_app_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: context.widthPx * 50.0,
                backgroundImage: const AssetImage("assets/common/profile.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "sample@gmail.com ",
                textAlign: TextAlign.center,
                style: TextFontStyle.med(size: context.textPx * 20),
              ),
            ),
            SizedBox(
              height: context.heightPx * 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthPx * 30.0, vertical: context.heightPx * 10),
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: context.heightPx * 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Logout",
                        textAlign: TextAlign.center,
                        style: TextFontStyle.med(size: context.textPx * 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon((Icons.logout)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

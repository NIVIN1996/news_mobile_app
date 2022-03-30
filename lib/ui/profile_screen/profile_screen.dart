import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/ui/widgets/app_bar_widget/common_app_bar_widget.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:news_mobile_app/utils/text_style/text_case.dart';

import '../../utils/text_style/text_style.dart';
import '../navigation/routes.dart';

class ProfileScreen extends StatefulWidget {
  final User? user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? _currentUser;
  bool _isSigningOut = false;
  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

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
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                widget.user !=null?_currentUser!.displayName.toString().toTitleCase():"",
                textAlign: TextAlign.center,
                style: TextFontStyle.med(size: context.textPx * 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                widget.user !=null? _currentUser!.email.toString() : "",
                textAlign: TextAlign.center,
                style: TextFontStyle.med(size: context.textPx * 20),
              ),
            ),
            SizedBox(
              height: context.heightPx * 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthPx * 30.0, vertical: context.heightPx * 10),
              child: _isSigningOut
                  ? const CircularProgressIndicator()
                  : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _isSigningOut = true;
                            });
                            await FirebaseAuth.instance.signOut();
                            setState(() {
                              _isSigningOut = false;
                            });
                            context.pushNamedAndRemoveUntil(ScreenNames.login);

                          },
                          child: RichText(
                            text:  TextSpan(
                              children: [
                                TextSpan(
                                  text: "Log Out ",
                                  style: TextFontStyle.med(size: context.textPx * 20,color: AppColor.black),
                                ),
                                const WidgetSpan(
                                  child: Icon(Icons.logout, size: 20,color: AppColor.black,),
                                ),

                              ],
                            ),
                          ),

                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                    ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}

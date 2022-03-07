import 'package:flutter/material.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/common_padding/common_padding.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import '../../utils/text_style/text_style.dart';
import '../../widgets/button_widget/custom_button_widget.dart';
import '../../widgets/text_form_widget/text_form_widget.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Container(
          height: context.percentHeight * 50,
          width: double.infinity,
          margin: EdgeInsets.all(context.widthPx * 20.0),
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              boxShadow: const [BoxShadow(color: AppColor.lightColor, blurRadius: 5.0)],
              borderRadius: BorderRadius.circular(context.widthPx * 10),
              border: Border.all(color: AppColor.hintColor)),
          child: Padding(
            padding: CommonPadding.paddingW25(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: Text("News4U",
                      textAlign: TextAlign.right,
                      style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 30)),
                ),
                TextFormWidget(
                  labelText: "Email",
                  controller: emailController,
                ),
                TextFormWidget(
                  labelText: "Password",
                  controller: passwordController,
                ),
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?",
                          textAlign: TextAlign.right,
                          style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 14)),
                    ],
                  ),
                ),
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: const CustomButton(
                    label: "Sign In",
                  ),
                ),
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(ScreenNames.registrationScreen);
                    },
                    child: Text("Don't have an Account? Sign Up",
                        textAlign: TextAlign.right,
                        style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

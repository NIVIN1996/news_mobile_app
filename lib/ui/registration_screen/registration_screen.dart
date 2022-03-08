import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/common_padding/common_padding.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../services/navigator/routes.dart';
import '../../utils/text_style/text_style.dart';
import '../../widgets/button_widget/custom_button_widget.dart';
import '../../widgets/text_form_widget/text_form_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Container(
          height: context.percentHeight * 60,
          width: double.infinity,
          margin: EdgeInsets.all(context.widthPx * 20.0),
          decoration: BoxDecoration(color: AppColor.whiteColor,
              boxShadow: const [BoxShadow(color: AppColor.lightColor, blurRadius: 5.0)],
              borderRadius: BorderRadius.circular(context.widthPx * 10), border: Border.all(color: AppColor.hintColor)),
          child: Padding(
            padding: CommonPadding.paddingW25(context),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: Text("News4U",
                      textAlign: TextAlign.right, style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 30)),
                ),

                TextFormWidget(
                  labelText: "Email",
                  controller: emailController,
                ),
                TextFormWidget(showEyeIcon: true,
                  labelText: "Password",
                  controller: passwordController,
                ),
                TextFormWidget(
                  showEyeIcon: true,
                  labelText: "Confirm Password",
                  controller: confirmPasswordController,
                ),

                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: const CustomButton(label: "Sign Up",),
                ),
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: GestureDetector(
                    onTap: (){
                      context.pushNamed(ScreenNames.login);
                    },
                    child: Text("Already Have an Account? Sign In",
                        textAlign: TextAlign.right, style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 14)),
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

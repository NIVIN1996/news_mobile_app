import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../services/navigator/routes.dart';
import '../../utils/color/colors.dart';
import '../../utils/common_padding/common_padding.dart';
import '../../utils/text_style/text_style.dart';
import '../../widgets/button_widget/custom_button_widget.dart';
import '../../widgets/text_form_widget/text_form_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.percentHeight * 50,
          width: double.infinity,
          margin: EdgeInsets.all(context.widthPx * 20.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: const [BoxShadow( blurRadius: 3.0)],
              borderRadius: BorderRadius.circular(context.widthPx * 10),
              border: Border.all(color: AppColor.hintColor)),
          child: Padding(
            padding: CommonPadding.paddingW25(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child:
                      Text("News4U", textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 30)),
                ),
                TextFormWidget(
                  labelText: "New Password",
                  showEyeIcon: true,
                  controller: passwordController,
                ),
                TextFormWidget(
                  labelText: "Confirm Password",
                  showEyeIcon: true,
                  controller: confirmPasswordController,
                ),
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: CustomButton(
                    label: "Save",
                    onPress: () {
                      context.pushNamed(ScreenNames.login);
                    },
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

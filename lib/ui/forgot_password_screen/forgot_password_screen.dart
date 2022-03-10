import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../services/navigator/routes.dart';
import '../../utils/color/colors.dart';
import '../../utils/common_padding/common_padding.dart';
import '../../utils/text_style/text_style.dart';
import '../../widgets/button_widget/custom_button_widget.dart';
import '../../widgets/text_form_widget/text_form_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.percentHeight * 40,
          width: double.infinity,
          margin: EdgeInsets.all(context.widthPx * 20.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
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
                  child:
                      Text("News4U", textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 30)),
                ),
                TextFormWidget(
                  labelText: "Email",
                  controller: emailController,
                ),
                Padding(
                  padding: CommonPadding.paddingH10(context),
                  child: CustomButton(
                    onPress: () {
                      context.pushNamed(ScreenNames.changePasswordScreen);
                    },
                    label: "Send",
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

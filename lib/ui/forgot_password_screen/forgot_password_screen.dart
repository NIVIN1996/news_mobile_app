import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/ui/widgets/button_widget/custom_button_widget.dart';
import 'package:news_mobile_app/ui/widgets/text_form_widget/text_form_widget.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import '../navigation/routes.dart';
import '../../utils/color/colors.dart';
import '../../utils/common_padding/common_padding.dart';
import '../../utils/text_style/text_style.dart';
import '../widgets/snackbar_widget/snackbar_widget.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();
  var email = "";
  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      AppSnackBar.showSnackBarWithText(context: context, text: "Password Reset Email has been sent. Please check your mail!",duration:const Duration(seconds: 5) );
      context.pushNamed(ScreenNames.login);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppSnackBar.showSnackBarWithText(context: context, text: "No user found for that email.",backgroundColor: AppColor.red,);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: context.percentHeight * 40,
          width: double.infinity,
          margin: EdgeInsets.all(context.widthPx * 20.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: const [BoxShadow(blurRadius: 3.0)],
              borderRadius: BorderRadius.circular(context.widthPx * 10),
              border: Border.all(color: AppColor.hintColor)),
          child: Padding(
            padding: CommonPadding.paddingW25(context),
            child: Form(
              key: _formKey,
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
                      onPress: () async{
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                          });
                          resetPassword();
                        }
                        // context.pushNamed(ScreenNames.changePasswordScreen);
                      },
                      label: "Send",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

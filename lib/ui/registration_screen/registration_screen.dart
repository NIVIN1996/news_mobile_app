import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/widgets/button_widget/custom_button_widget.dart';
import 'package:news_mobile_app/ui/widgets/text_form_widget/text_form_widget.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/common_padding/common_padding.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../login_screen/fire_auth.dart';
import '../login_screen/validator.dart';
import '../navigation/routes.dart';
import '../../utils/text_style/text_style.dart';
import '../widgets/loader/spinkit_loader.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool showPhoneNumberValidation = false;
  bool showEmailValidation = false;
  bool showNameValidation = false;

  final _registerFormKey = GlobalKey<FormState>();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                  key: _registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: CommonPadding.paddingH10(context),
                        child: Text("News4U",
                            textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 30)),
                      ),
                      TextFormWidget(
                        labelText: "Name",
                        controller: nameController,
                        maxLength: 100,
                        validation: (value) => Validator.validateName(
                          name: value,
                        ),
                        onChange: (String text) {
                          setState(() {
                            showNameValidation = false;
                          });
                        },
                      ),
                      TextFormWidget(
                        labelText: "Email",
                        controller: emailController,
                        maxLength: 70,
                        validation: (value) => Validator.validateEmail(
                          email: value!.trimRight(),
                        ),
                        onChange: (String text) {
                          setState(() {
                            showEmailValidation = false;
                          });
                        },
                      ),
                      TextFormWidget(
                        showEyeIcon: true,
                        labelText: "Password",
                        controller: passwordController,
                        maxLength: 20,
                        validation: (value) => Validator.validatePassword(
                          password: value,
                        ),
                      ),
                      TextFormWidget(
                        showEyeIcon: true,
                        labelText: "Confirm Password",
                        controller: confirmPasswordController,
                        maxLength: 20,
                        validation: (value) {
                          if (passwordController.text.isEmpty) {
                            return 'Please re-enter password';
                          }
                          if (passwordController.text != confirmPasswordController.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                      ),
                      _isProcessing
                          ? const SpinKitWidget()
                          : Padding(
                              padding: CommonPadding.paddingH10(context),
                              child: CustomButton(
                                label: "Sign Up",
                                onPress: () async {
                                  setState(() {
                                    if (nameController.text.isNotEmpty &&
                                        emailController.text.trim().isNotEmpty &&
                                        passwordController.text.trim().isNotEmpty&&
                                    confirmPasswordController.text.isNotEmpty) {
                                      _isProcessing = true;
                                    } else {
                                      _isProcessing = false;
                                    }
                                  });
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  if (_registerFormKey.currentState!.validate()) {
                                    User? user = await FireAuth.registerUsingEmailPassword(
                                      context: context,
                                      name: nameController.text,
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                  }
                                },
                              ),
                            ),
                      Padding(
                        padding: CommonPadding.paddingH10(context),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(ScreenNames.login);
                          },
                          child: Text("Already Have an Account? Sign In",
                              textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

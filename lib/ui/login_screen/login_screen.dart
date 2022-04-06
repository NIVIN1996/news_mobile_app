import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/login_screen/validator.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import '../../utils/color/colors.dart';
import '../../utils/common_padding/common_padding.dart';
import '../../utils/text_style/text_style.dart';
import '../navigation/routes.dart';
import '../widgets/button_widget/custom_button_widget.dart';
import '../widgets/text_form_widget/text_form_widget.dart';
import 'fire_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool showEmailUserNameValidation = false;
  bool showPasswordValidation = false;

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      context.pushNamedAndRemoveUntil(ScreenNames.homeScreen,arguments: user);
    }

    return firebaseApp;
  }

  @override
  void initState() {
    _initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // height: context.percentHeight * 55,
                width: double.infinity,
                margin: EdgeInsets.all(context.widthPx * 20.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    boxShadow: const [BoxShadow(blurRadius: 3.0)],
                    borderRadius: BorderRadius.circular(context.widthPx * 10),
                    border: Border.all(color: AppColor.hintColor)),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: CommonPadding.paddingW25(context),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: CommonPadding.paddingH10(context),
                          child: Text("News4U",
                              textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 30)),
                        ),
                        TextFormWidget(
                          labelText: "Email",
                          controller: _emailTextController,
                          focusNode: _focusEmail,
                          maxLength: 70,
                          // keyboardType: TextInputType.emailAddress,
                          validation: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          onChange: (String text) {
                            setState(() {
                              showEmailUserNameValidation = false;
                            });
                          },
                        ),
                        TextFormWidget(
                          labelText: "Password",
                          showEyeIcon: true,
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          maxLength: 20,
                          // keyboardType: TextInputType.text,

                          validation: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          onChange: (String text) {
                            setState(() {
                              showPasswordValidation = false;
                            });
                          },
                        ),
                        Padding(
                          padding: CommonPadding.paddingH10(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed(ScreenNames.forgotPasswordScreen);
                                },
                                child: Text("Forgot Password?",
                                    textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 14)),
                              ),
                            ],
                          ),
                        ),
                        _isProcessing
                            ? const CircularProgressIndicator()
                            : Padding(
                                padding: CommonPadding.paddingH10(context),
                                child: CustomButton(
                                  label: "Sign In",
                                  onPress: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      // setState(() {
                                      //   _isProcessing = true;
                                      // });

                                      User? user = await FireAuth.signInUsingEmailPassword(
                                        context: context,
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                      );

                                      // setState(() {
                                      //   _isProcessing = false;
                                      // });

                                    }
                                  },
                                ),
                              ),
                        Padding(
                          padding: CommonPadding.paddingH10(context),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(ScreenNames.registrationScreen);
                            },
                            child: Text("Don't have an Account? Sign Up",
                                textAlign: TextAlign.right, style: TextFontStyle.med(size: context.textPx * 14)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  context.pushNamedReplacement(ScreenNames.homeScreen, arguments: null);
                },
                child: Text(
                  'Skip',
                  textAlign: TextAlign.right,
                  style: TextFontStyle.med(size: context.textPx * 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

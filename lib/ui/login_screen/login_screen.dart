import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/home_screen/home_screen.dart';
import 'package:news_mobile_app/ui/login_screen/validator.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import '../../utils/color/colors.dart';
import '../../utils/common_padding/common_padding.dart';
import '../../utils/text_style/text_style.dart';
import '../navigation/routes.dart';
import '../widgets/button_widget/custom_button_widget.dart';
import '../widgets/snackbar_widget/snackbar_widget.dart';
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

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: context.percentHeight * 50,
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
                                // keyboardType: TextInputType.emailAddress,
                                validation: (value) => Validator.validateEmail(
                                  email: value,
                                ),
                              ),
                              TextFormWidget(
                                labelText: "Password",
                                showEyeIcon: true,
                                controller: _passwordTextController,
                                focusNode: _focusPassword,
                                // keyboardType: TextInputType.text,
                                validation: (value) => Validator.validatePassword(
                                  password: value,
                                ),
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
                                          textAlign: TextAlign.right,
                                          style: TextFontStyle.med(size: context.textPx * 14)),
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

                                          if (_formKey.currentState!.validate()) {
                                            setState(() {
                                              _isProcessing = true;
                                            });

                                            User? user = await FireAuth.signInUsingEmailPassword(
                                              context: context,
                                              email: _emailTextController.text,
                                              password: _passwordTextController.text,
                                            );

                                            AppSnackBar.showSnackBarWithText(
                                                context: context, text: "Logged In Successfully...");
                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (user != null) {
                                              context.pushNamed(ScreenNames.homeScreen, arguments: user);
                                            } else {
                                              AppSnackBar.showSnackBarWithText(
                                                  context: context,
                                                  text: "Login Failed",
                                                  backgroundColor: AppColor.red);
                                            }
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
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
              elevation: 0.0,
              child: Text(
                'Skip',
                textAlign: TextAlign.right,
                style: TextFontStyle.med(size: context.textPx * 20),
              ),
              backgroundColor: AppColor.whiteColor,
              onPressed: () {
                context.pushNamedReplacement(ScreenNames.homeScreen, arguments: null);
              })),
    );
  }
}

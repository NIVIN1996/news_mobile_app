import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/color/colors.dart';
import '../widgets/snackbar_widget/snackbar_widget.dart';

class FireAuth {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppSnackBar.showSnackBarWithText(
            context: context, text: "Password Provided is too Weak", backgroundColor: AppColor.red);
      } else if (e.code == 'email-already-in-use') {
        AppSnackBar.showSnackBarWithText(
            context: context, text: "Account Already exists", backgroundColor: AppColor.red);
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppSnackBar.showSnackBarWithText(
            context: context, text: "No User Found for that Email", backgroundColor: AppColor.red);
      } else if (e.code == 'wrong-password') {
        print(e.code);
        AppSnackBar.showSnackBarWithText(
            context: context, text: "Wrong Password Provided by User", backgroundColor: AppColor.red);
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  static Future<User?> resetPasswordUsingEmail({
    required BuildContext context,
    required String email,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
       await auth.sendPasswordResetEmail(email: email);

      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        AppSnackBar.showSnackBarWithText(
          context: context,
          text: "No user found for that email.",
        );
      }
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}

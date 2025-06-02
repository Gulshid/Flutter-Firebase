import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupprovider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  //Future function when we sign up
  Future<void> signUp(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      UserCredential userid = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            top: 20.0,
            left: 16.0,
            right: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor: Colors.green,
          content: Text('Sign up Successfully created--->'),
        ),
      );

      // ignore: avoid_print
      print('User ID : ${userid.user?.uid}');
    } catch (e) {
      // ignore: avoid_print
      print('Sign up error--------> $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            top: 20.0,
            left: 16.0,
            right: 16.0,
          ),
          backgroundColor: Colors.red,
          content: Text('Account creation issues-->'),
        ),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //function for dispose all controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  

}
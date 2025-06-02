import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_backend/views_/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginprovider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  //Future function for login
  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      UserCredential userid = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      if (userid.user!.uid.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor: Colors.green,
          content: Text('logged in Successfully--->'),
        ),
      );
      
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
        print('User ID : ${userid.user?.uid}');
        isLoading = false;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: Colors.red,
            content: Text('User Does not exists'),
          ),
        );
        isLoading = false;
        notifyListeners();
      }

      
    } catch (e) {
      isLoading = false;
      notifyListeners();
      // ignore: avoid_print
      print('Sign up error--------> $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
          backgroundColor: Colors.red,
          content: Text('Something went wrong'),
        ),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

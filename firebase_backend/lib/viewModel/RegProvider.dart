// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Regprovider with ChangeNotifier {
  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isloading = false;

  //Future function when we sign up
  Future<void> Register(BuildContext context) async {
    isloading = true;
    notifyListeners();

    try {
      UserCredential userid = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      Flushbar(
        message: "Register Successfully created",
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     behavior: SnackBarBehavior.floating,
      //     margin: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10.r),
      //     ),
      //     backgroundColor: Colors.green,
      //     content: Text('Register Successfully created--->'),
      //   ),
      // );

      print('user id -------->${userid.user?.uid}');
      await storeData(userid.user!.uid);
      isloading = true;
      notifyListeners();
    } catch (e) {
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

      isloading = true;
      notifyListeners();
    } finally {
      isloading = false;
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

  //function for firestore data Stroage
  Future<void> storeData(String Userid) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users Data')
          .doc(Userid)
          .set({
            'First Name': first_nameController.text,
            'Last Name': last_nameController.text,
            'Email': emailController.text,
            'Password': passwordController.text,
          });
    } catch (e) {
      print('upload data isssue --------->$e');
    } finally {}
  }
}

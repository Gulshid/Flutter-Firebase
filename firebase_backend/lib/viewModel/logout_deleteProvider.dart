// ignore_for_file: avoid_print

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutDeleteprovider with ChangeNotifier {
  final currentUserId = FirebaseAuth.instance.currentUser;

  //function for logout Account
  Future<void> logoutAccount(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Flushbar(
        message: "Logout Successfully",
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
    } catch (e) {
      print('logout Error issue------->$e');
      Flushbar(
        message: "Logout failed please try again later",
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
    }
  }

  //functio for delete Account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      Flushbar(
        message: "Deleting Account is Successfully",
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
    } catch (e) {
      print('Delete account error issue------->$e');
      Flushbar(
        message: "Delete account failed please try again later",
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP, // or BOTTOM
      ).show(context);
    }
  }
}

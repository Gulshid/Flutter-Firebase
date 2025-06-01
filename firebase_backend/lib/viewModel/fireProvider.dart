import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Fireprovider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordConyroller = TextEditingController();

  bool isLoading = false;

  //Future function when we sign up
  Future<void> signUp(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      UserCredential userid = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordConyroller.text,
          );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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
    passwordConyroller.dispose();
    super.dispose();
  }
}

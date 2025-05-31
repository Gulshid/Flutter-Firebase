// ignore: file_names
// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordConyroller = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 15.sp),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              obscuringCharacter: '*',
              controller: passwordConyroller,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.remove_red_eye, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 30.sp),
          GestureDetector(
            onTap: () async {
              setState(() {
                isLoading = true;
              });
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

                setState(() {
                  isLoading = false;
                });
              } catch (e) {
                // ignore: avoid_print
                print('Sign up error--------> $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Account creation issues-->'),
                  ),
                );
                setState(() {
                  isLoading = false;
                });
              }finally{
                setState(() {
                  isLoading = false;
                });
              }
            },
            child: Container(
              height: 50.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.r),
              ),

              child:isLoading?  SpinKitFadingCube(size: 25.sp, color: Colors.orange,)  :  Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black, fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

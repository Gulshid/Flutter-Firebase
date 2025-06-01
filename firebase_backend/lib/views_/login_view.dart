import 'package:firebase_backend/Routes/Routesname.dart';
import 'package:firebase_backend/viewModel/fireProvider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final Profire = Provider.of<Fireprovider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Login Account',
              style: GoogleFonts.poppins(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              ),
            ),
          ),
          SizedBox(height: 15.sp),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: Profire.emailController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 30.sp),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              obscuringCharacter: '*',
              controller: Profire.passwordConyroller,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.remove_red_eye, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 30.sp),
          GestureDetector(
            onTap: () => Profire.signUp(context),

            child: Container(
              height: 50.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.r),
              ),

              child:
                  Profire.isLoading
                      ? SpinKitFadingCube(size: 25.sp, color: Colors.orange)
                      : Center(
                        child: Text(
                          'login Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
            ),
          ),

          SizedBox(height: 20.sp),
          Text.rich(
            TextSpan(
              text: 'Don\'t have an account?',
              style: GoogleFonts.aBeeZee(fontSize: 20.sp, color: Colors.black),
              children: [
                TextSpan(
                  text: ' Sign Up',
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, Routesname.signUp);
                        },
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

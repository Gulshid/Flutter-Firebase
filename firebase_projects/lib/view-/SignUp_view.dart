import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  ValueNotifier<bool> obsecured = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up Now',
            style: GoogleFonts.pacifico(fontSize: 20.sp, color: Colors.teal),
          ),

          SizedBox(height: 20.h),
          TextField(
            style: GoogleFonts.aBeeZee(fontSize: 13.sp, color: Colors.black),
            decoration: InputDecoration(
              label: Text(
                'Email',
                style: GoogleFonts.pacifico(color: Colors.orangeAccent),
              ),
              hintText: 'Enter Your Email',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.blue),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),

              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          TextField(
            style: GoogleFonts.aBeeZee(fontSize: 13.sp, color: Colors.black),
            decoration: InputDecoration(
              label: Text(
                'Password',
                style: GoogleFonts.pacifico(color: Colors.orangeAccent),
              ),
              hintText: 'Enter Your Password',
              hintStyle: GoogleFonts.aBeeZee(
                fontSize: 13.sp,
                color: Colors.black,
              ),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.blue),
              suffixIcon: GestureDetector(
                onTap: () {
                  obsecured.value = !obsecured.value;
                },
                child: Icon(
                  obsecured.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.blue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),

              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

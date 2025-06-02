import 'package:firebase_backend/viewModel/RegProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegView extends StatefulWidget {
  const RegView({super.key});

  @override
  State<RegView> createState() => _RegViewState();
}
//This is Firebase Firestore Registration View
class _RegViewState extends State<RegView> {
  @override
  Widget build(BuildContext context) {
    final pro_firestore=Provider.of<Regprovider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Register Account',
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              ),
            ),
          ),
          SizedBox(height: 15.sp),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: pro_firestore.first_nameController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'First Name',
                hintText: 'Enter first Name',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 25.sp),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: pro_firestore.last_nameController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter last Name',
                prefixIcon: Icon(Icons.remove_red_eye, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),
          
          SizedBox(height: 25.sp),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: pro_firestore.emailController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your Email',
                prefixIcon: Icon(Icons.remove_red_eye, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.r),
                ),
              ),
            ),
          ),
            
          SizedBox(height: 25.sp),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              obscuringCharacter: '*',
              controller: pro_firestore.passwordController,
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
            onTap: () => pro_firestore.Register(context),

            child: Container(
              height: 50.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(18.r),
              ),

            child:
                pro_firestore.isloading
                ? SpinKitFadingCube(size: 25.sp, color: Colors.orange)
                : Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    ),
                  ),
                ),
            ),
          ),

        
        ],
      ),
    );
  }
}

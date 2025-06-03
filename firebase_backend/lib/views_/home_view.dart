import 'package:firebase_backend/viewModel/logout_deleteProvider.dart';
import 'package:firebase_backend/views_/SignUp_view.dart';
import 'package:firebase_backend/views_/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final log_delProvider = Provider.of<LogoutDeleteprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (log_delProvider.currentUserId!.uid.isNotEmpty) {
                      log_delProvider.logoutAccount(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    }
                  },
                  child: Container(
                    height: 50.h,
                    width: 100.w,

                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),

                GestureDetector(

                  onTap: () async{
                    await log_delProvider.deleteAccount(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupView()),
                    );
                  },
                  child: Container(
                    height: 50.h,
                    width: 100.w,

                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20.w),
                Text(
                  'logout Account',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
                Text(
                  'Delete Accout',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

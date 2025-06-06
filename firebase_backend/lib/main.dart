
import 'package:firebase_backend/Routes/Routes.dart';
import 'package:firebase_backend/Routes/Routesname.dart';
import 'package:firebase_backend/firebase_options.dart';
import 'package:firebase_backend/viewModel/RegProvider.dart';
import 'package:firebase_backend/viewModel/SignUpProvider.dart';
import 'package:firebase_backend/viewModel/crudOperaProvider.dart';
import 'package:firebase_backend/viewModel/loginProvider.dart';
import 'package:firebase_backend/viewModel/logout_deleteProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //firebase Initalization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Signupprovider()),
            ChangeNotifierProvider(create: (_)=> Loginprovider()),
            ChangeNotifierProvider(create: (_)=> Regprovider()),
            ChangeNotifierProvider(create: (_)=>LogoutDeleteprovider()),
            ChangeNotifierProvider(create: (_)=>Crudoperaprovider()),
          ],

          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Firebase Backend',
                theme: ThemeData(
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.teal),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),

                initialRoute: Routesname.crud,
                onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
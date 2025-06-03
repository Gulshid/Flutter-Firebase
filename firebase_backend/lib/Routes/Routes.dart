import 'package:firebase_backend/Routes/Routesname.dart';
import 'package:firebase_backend/views_/Reg_view.dart';
import 'package:firebase_backend/views_/SignUp_view.dart';
import 'package:firebase_backend/views_/crud_view.dart';
import 'package:firebase_backend/views_/home_view.dart';
import 'package:firebase_backend/views_/login_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings Set) {
    switch (Set.name) {
      case Routesname.home:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeView(),
          );
        }

      case Routesname.signUp:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => SignupView(),
          );
        }

      case Routesname.login:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => LoginView(),
          );
        }

      case Routesname.register:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => RegView(),
          );
        }

      case Routesname.crud:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => CrudView(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(body: Center(child: Text('No Route found'))),
          );
        }
    }
  }
}

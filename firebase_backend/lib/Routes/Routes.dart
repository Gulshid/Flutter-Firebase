import 'package:firebase_backend/Routes/Routesname.dart';
import 'package:firebase_backend/views_/SignUp_view.dart';
import 'package:firebase_backend/views_/home_view.dart';
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

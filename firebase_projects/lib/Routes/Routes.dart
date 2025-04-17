import 'package:firebase_projects/view-/Home_view.dart';

import 'RoutesName.dart';
import '../view-/SignUp_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generate_Route(RouteSettings hello) {
    switch (hello.name) {
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
                (_) => Scaffold(
                  body: Center(child: Text('No Route here it thsi point')),
                ),
          );
        }
    }
  }
}

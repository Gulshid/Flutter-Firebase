import 'RoutesName.dart';
import '../view-/home_view.dart';
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

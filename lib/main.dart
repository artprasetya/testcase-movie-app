import 'package:majootestcase/landing.dart';
import 'package:flutter/material.dart';
import 'package:majootestcase/modules/detail_movie/page.dart';
import 'package:majootestcase/modules/home/page.dart';
import 'package:majootestcase/modules/login/page.dart';
import 'package:majootestcase/modules/register/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }

  Map<String, WidgetBuilder> get routes {
    return {
      '/': (BuildContext context) => LandingPage(),
      '/landing': (BuildContext context) => LandingPage(),
      '/login': (BuildContext context) => LoginPage(),
      '/register': (BuildContext context) => RegisterPage(),
      '/home': (BuildContext context) => HomePage(),
      '/home/detail': (BuildContext context) => DetailMoviePage(),
    };
  }
}

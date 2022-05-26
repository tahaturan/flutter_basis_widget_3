import 'package:flutter/material.dart';
import 'package:flutter_basis_widget_3/route_generator.dart';
import 'package:flutter_basis_widget_3/views/my_home_page.dart';
import 'package:flutter_basis_widget_3/views/redpage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.blue
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      builder: EasyLoading.init(),
      // routes: {
      //   "redPage": (context) => RedPage(),
      // },
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

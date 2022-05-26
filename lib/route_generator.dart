import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basis_widget_3/views/my_home_page.dart';
import 'package:flutter_basis_widget_3/views/redpage.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return rotaOlustur(const MyHomePage());
      case "redPage":
        return rotaOlustur(RedPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Hata"),
            ),
            body: const Center(
              child: Text("Sayfa Bulunamadi"),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> rotaOlustur(Widget gidilecekRota) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        builder: (context) => gidilecekRota,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        builder: (context) => gidilecekRota,
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => gidilecekRota,
      );
    }
  }
}

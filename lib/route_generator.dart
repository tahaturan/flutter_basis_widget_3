import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basis_widget_3/views/my_home_page.dart';
import 'package:flutter_basis_widget_3/views/ogrenci_detay.dart';
import 'package:flutter_basis_widget_3/views/ogrenci_listesi.dart';
import 'package:flutter_basis_widget_3/views/redpage.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return rotaOlustur(const MyHomePage(), settings);
      case "/redPage":
        return rotaOlustur(RedPage(), settings);
      case "/ogrenciListesi":
        return rotaOlustur(const OgrenciListesi(), settings);
      case "/ogrenciDetay":
        var parametredekiOgrenci = settings.arguments as Ogrenci;
        return rotaOlustur(
            OgreciDetay(secilenOgrenci: parametredekiOgrenci), settings);
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

  static PageRoute<dynamic> rotaOlustur(
      Widget gidilecekRota, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekRota,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekRota,
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekRota,
      );
    }
  }
}

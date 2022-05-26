import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);
  int rasgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint("onWillPop Calisti");
        rasgeleSayi = Random().nextInt(100);
        Navigator.pop(context, rasgeleSayi);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Red Page'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Red Page"),
              ElevatedButton(
                onPressed: () {
                  rasgeleSayi = Random().nextInt(100);
                  debugPrint("Uretilen Sayi $rasgeleSayi");
                  Navigator.pop(context, rasgeleSayi);
                },
                child: const Text(
                  "AnaSayfa ya veri Gonder",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

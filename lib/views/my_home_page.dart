import 'package:flutter/material.dart';
import 'package:flutter_basis_widget_3/views/card_listtile.dart';
import 'package:flutter_basis_widget_3/widgets/sayfa_gecis_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AnaSayfa"),
        ),
        body: Center(
          child: Column(
            children: [
              SayfaGecisButton(
                  isim: "Card & Listtile Kullanimi",
                  sayfa: const CardveListtileKullanimi()),
            ],
          ),
        ));
  }
}

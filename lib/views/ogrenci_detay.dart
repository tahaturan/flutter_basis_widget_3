import 'package:flutter/material.dart';
import 'package:flutter_basis_widget_3/views/ogrenci_listesi.dart';

class OgreciDetay extends StatelessWidget {
  final Ogrenci secilenOgrenci;
  const OgreciDetay({required this.secilenOgrenci, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ogenci Detay'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(secilenOgrenci.id.toString()),
            Text(secilenOgrenci.isim),
            Text(secilenOgrenci.soyIsim),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int elemanSayisi = ModalRoute.of(context)!.settings.arguments as int;
    debugPrint("Elemen sayisi alindi : $elemanSayisi");

    List<Ogrenci> tumOgrenciler = List.generate(
      elemanSayisi,
      (index) => Ogrenci(index + 1, "Ogrenci Adi ${index + 1}",
          "Ogrenci SoyIsim: ${index + 1}"),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ogrenci Listesi'),
      ),
      body: ListView.builder(
        itemCount: elemanSayisi,
        itemBuilder: (BuildContext context, int index) {
          var oankiOgrenci = tumOgrenciler[index];
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/ogrenciDetay",
                  arguments: oankiOgrenci);
            },
            leading: CircleAvatar(
              child: Text(oankiOgrenci.id.toString()),
            ),
            title: Text(oankiOgrenci.isim),
            subtitle: Text(oankiOgrenci.soyIsim),
          );
        },
      ),
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyIsim;

  Ogrenci(this.id, this.isim, this.soyIsim);
}

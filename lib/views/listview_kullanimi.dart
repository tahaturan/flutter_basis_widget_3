import 'package:flutter/material.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(
        index + 1, "Ogrenci Adi ${index + 1}", "Ogrenci Soyad ${index + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Kullanimi"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var oankiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0 ? Colors.amber[200] : Colors.blue[200],
            shadowColor: index % 2 == 0 ? Colors.blue[200] : Colors.amber[200],
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(oankiOgrenci.isim),
              subtitle: Text(oankiOgrenci.soyIsim),
              leading: CircleAvatar(
                child: Text(oankiOgrenci.id.toString()),
              ),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
      ),
    );
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map(
            (Ogrenci ogr) => ListTile(
              title: Text(ogr.isim),
              subtitle: Text(ogr.soyIsim),
              leading: CircleAvatar(
                child: Text(ogr.id.toString()),
              ),
            ),
          )
          .toList(),
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyIsim;

  Ogrenci(this.id, this.isim, this.soyIsim);
}

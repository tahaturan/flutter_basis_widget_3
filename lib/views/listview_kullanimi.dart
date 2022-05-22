import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      body: ListView.separated(
        itemBuilder: (context, index) {
          var oankiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0 ? Colors.green[300] : Colors.cyan[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(oankiOgrenci.isim),
              subtitle: Text(oankiOgrenci.soyIsim),
              leading: CircleAvatar(
                child: Text(oankiOgrenci.id.toString()),
              ),
              onTap: () {
                EasyLoading.showToast(
                  "Eleman Tiklandi",
                  toastPosition: EasyLoadingToastPosition.bottom,
                );
              },
              onLongPress: () {
                _alertDialogIslemleri(context, oankiOgrenci.isim);
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.blueGrey,
            thickness: 2,
            indent: 50,
            endIndent: 50,
          );
        },
        itemCount: tumOgrenciler.length,
      ),
    );
  }

  ListView listviewBuilder() {
    return ListView.builder(
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

void _alertDialogIslemleri(BuildContext myContext, String name) {
  showDialog(
      context: myContext,
      builder: (contex) {
        return AlertDialog(
          title: Text(name),
          content: const Text("Icerik"),
          actions: [
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Kapat",
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Tamam",
                  ),
                ),
              ],
            )
          ],
        );
      });
}

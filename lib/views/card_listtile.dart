import 'package:flutter/material.dart';

class CardveListtileKullanimi extends StatelessWidget {
  const CardveListtileKullanimi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Ve Listtile Kullanimi"),
      ),
      body: Center(
        child: ListView(
          reverse: true, //*tersten siralar elemanlari

          children: [
            Column(
              children: [
                myCard(),
                myCard(),
                myCard(),
                myCard(),
                myCard(),
                myCard(),
                myCard(),
                myCard(),
                myCard(),
                myCard(),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarms_sharp),
            ),
            const Text(
                "Aralarindaki fark ListView yapisi bizden children yapida elemanlar bekliyor bu sekilde yenide ekleyebiliriz"),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView singleChildScroll() {
    return SingleChildScrollView(
      child: Column(
        children: [
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
          myCard(),
        ],
      ),
    );
  }

  Column myCard() {
    return Column(
      children: [
        Card(
          color: Colors.blue[200],
          shadowColor: Colors.amber,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const ListTile(
            leading: CircleAvatar(child: Icon(Icons.add)),
            title: Text("Baslik"),
            subtitle: Text("Alt Baslik"),
            trailing: Icon(Icons.train),
          ),
        ),
        const Divider(
          //*iki eleman arasini bolen cizgi
          color: Colors.red,
          thickness: 1,
          height: 10,
          indent: 20, //*soldan bosluk
          endIndent: 20, //*sagdan bosluk
        )
      ],
    );
  }
}

//! Bu yapilar performans Dostu Yapilar degildir cinku herbir eleman hafizada yer tutar az elemaniniz varsa kullanilirsaniz olur ama cok daha buyuk miktarda elemaniniz varsa kullmak pek dogru degildir
//! Mantik su seilde olmali sadece ekranda gorunenler listelesin seklinde digerleride ekrana geldikce olustulsun olmali
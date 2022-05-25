import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollandSlivers extends StatelessWidget {
  const CustomScrollandSlivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blueGrey,
          expandedHeight: 300,
          floating: true,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Sliver App Bar"),
            centerTitle: true,
            background: Image.network(
              "https://fotolifeakademi.com/uploads/2020/04/manzara-ve-doga-fotografciligi.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(4),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              sabitListeElamanlari,
            ),
          ),
        ),
        //* sabit elemanlarla bir satirda kac eleman olcagini soyledigimiz grid turu
        SliverGrid(
          delegate: SliverChildListDelegate(sabitListeElamanlari),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 5),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              _dinamikElemanUretenFonksiyon,
              childCount: 6,
            ),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(sabitListeElamanlari),
          itemExtent: 300,
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount: 10,
          ),
          itemExtent: 200,
        ),
        //* dinamik elemanlarla yani kac eleman utereceksek sayisini belirtip ayni zamanda bir satirda kac elemean olacagini belittirigmiz grid turu
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount: 10,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount: 12,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //*max genislik belirttik
          ),
        ),
        //*SliverGrid in birde isimlendirilmis constructorlari vardir yani yukarida islemleri direk kisa haldeden yapabiliriz
        SliverGrid.count(
          crossAxisCount: 3,
          children: sabitListeElamanlari,
        ),
        SliverGrid.extent(
          maxCrossAxisExtent: 300,
          children: sabitListeElamanlari,
        )
      ],
    );
  }

  List<Widget> get sabitListeElamanlari {
    return [
      Container(
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        child: const Text(
          "Sabit Liste Elemani 1",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        height: 100,
        color: Colors.teal,
        alignment: Alignment.center,
        child: const Text(
          "Sabit Liste Elemani 2",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text(
          "Sabit Liste Elemani 3",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: const Text(
          "Sabit Liste Elemani 4",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: const Text(
          "Sabit Liste Elemani 5",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        height: 100,
        color: Colors.cyan,
        alignment: Alignment.center,
        child: const Text(
          "Sabit Liste Elemani 6",
          style: TextStyle(fontSize: 15),
        ),
      ),
    ];
  }

  Widget? _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      color: rastgeleRenk(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik Liste Elemani ${index + 1}",
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

Color rastgeleRenk() {
  return Color.fromARGB(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
  );
}

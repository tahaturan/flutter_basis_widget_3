import 'package:flutter/material.dart';

class CustomScrollandSlivers extends StatelessWidget {
  const CustomScrollandSlivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text("Sliver App bar Baslik"),
          backgroundColor: Colors.blueGrey,
          expandedHeight: 300,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://fotolifeakademi.com/uploads/2020/04/manzara-ve-doga-fotografciligi.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            sabitListeElamanlari,
          ),
        ),
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
}

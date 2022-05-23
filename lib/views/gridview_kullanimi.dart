import 'package:flutter/material.dart';

class GridviewKullanimi extends StatelessWidget {
  const GridviewKullanimi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Kullanimi"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.blue[100 * ((index + 1) % 5)],
            child: Text(index.toString()),
          );
        },
      ),
    );
  }

  GridView gridviewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 500,
      scrollDirection: Axis.horizontal,
      children: [
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
        mycontainer("1"),
      ],
    );
  }

  GridView gridviewCount() {
    return GridView.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      crossAxisCount: 3,
      scrollDirection: Axis.horizontal,
      reverse: false,
      padding: const EdgeInsets.all(10),
      children: [
        mycontainer("1"),
        mycontainer("2"),
        mycontainer("3"),
        mycontainer("4"),
        mycontainer("5"),
        mycontainer("6"),
        mycontainer("7"),
        mycontainer("8"),
        mycontainer("9"),
      ],
    );
  }

  Padding mycontainer(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.teal[300],
        alignment: Alignment.center,
        child: Text(
          "Merhaba $name",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

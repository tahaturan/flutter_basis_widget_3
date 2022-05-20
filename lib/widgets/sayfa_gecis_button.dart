import 'package:flutter/material.dart';

class SayfaGecisButton extends StatefulWidget {
  String isim;
  Widget sayfa;
  SayfaGecisButton({Key? key, required this.isim, required this.sayfa})
      : super(key: key);

  @override
  State<SayfaGecisButton> createState() => _SayfaGecisButtonState();
}

class _SayfaGecisButtonState extends State<SayfaGecisButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.sayfa,
          ),
        );
      },
      child: Text(
        widget.isim,
      ),
    );
  }
}

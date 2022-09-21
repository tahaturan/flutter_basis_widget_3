import 'dart:async';

import 'package:flutter/material.dart';

class TimerKullanimi extends StatefulWidget {
  const TimerKullanimi({Key? key}) : super(key: key);

  @override
  State<TimerKullanimi> createState() => _TimerKullanimiState();
}

class _TimerKullanimiState extends State<TimerKullanimi> {
  late Timer zamanlayici;

  int kalanSure = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timer Kullanimi'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kalan Sure: $kalanSure sn",
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                onPressed: () {
                  zamanlayici =
                      Timer.periodic(const Duration(seconds: 1), (timer) {
                    setState(() {
                      if (kalanSure < 1) {
                        kalanSure = 10;
                        zamanlayici.cancel();
                      } else {
                        kalanSure--;
                      }
                    });
                  });
                },
                child: const Text(
                  "Basla",
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basis_widget_3/views/card_listtile.dart';
import 'package:flutter_basis_widget_3/views/custom_scroll_ve_slivers.dart';
import 'package:flutter_basis_widget_3/views/gridview_kullanimi.dart';
import 'package:flutter_basis_widget_3/views/listview_kullanimi.dart';
import 'package:flutter_basis_widget_3/views/redpage.dart';
import 'package:flutter_basis_widget_3/views/timer_kullanimi.dart';
import 'package:flutter_basis_widget_3/widgets/sayfa_gecis_button.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var flp = FlutterLocalNotificationsPlugin();
  //*bunu kullanarak bildirim gostebilecegiz

  Future<void> kurulum() async {
    var androidAyari =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosAyari = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {
        id = 1;
        title = "deneme";
        body = "denemee";
        payload = "payload";
      },
    );
    var kurulumAyari =
        InitializationSettings(android: androidAyari, iOS: iosAyari);

    await flp.initialize(
      kurulumAyari,
      onDidReceiveNotificationResponse: (details) => bildirimSecilme,
    );
  }

  Future<void> bildirimSecilme(String payload) async {
    if (payload != null) {
      debugPrint("Bildirim Secildi = $payload");
    }
  }

  Future<void> bildirimGoster() async {
    var androidBildirimDetay = const AndroidNotificationDetails(
        "kanal id", "kanal baslik",
        channelDescription: "kanal aciklama",
        priority: Priority.high,
        importance: Importance.max);
    var bildirimDetayi = NotificationDetails(android: androidBildirimDetay);
    await flp.show(0, "Baslik", "Icerik", bildirimDetayi,
        payload: "payload Icerik");
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnaSayfa"),
      ),
      body: Center(
        child: Column(
          children: [
            SayfaGecisButton(
                isim: "Card & Listtile Kullanimi",
                sayfa: const CardveListtileKullanimi()),
            SayfaGecisButton(
                isim: "ListView Kullanimi", sayfa: ListViewKullanimi()),
            SayfaGecisButton(
                isim: "GridView Kullanimi", sayfa: const GridviewKullanimi()),
            SayfaGecisButton(
                isim: "Custom Sctoll & Slivers",
                sayfa: const CustomScrollandSlivers()),
            ElevatedButton(
              onPressed: () async {
                int? gelenSayi = await Navigator.push<int>(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => RedPage(),
                  ),
                );
                debugPrint("Anasayfaya Gelen Sayi $gelenSayi");
              },
              child: const Text(
                "IOS icin Gecis Butonu",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RedPage(),
                  ),
                ).then(
                  (int? value) =>
                      debugPrint("Anasayfaya Then ile gelen veri $value"),
                );
              },
              child: const Text(
                "Then Kullanarak Veriyi alma",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/redPage");
              },
              child: const Text(
                "Isimlendirilmis Route",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/ogrenciListesi", arguments: 60);
              },
              child: const Text(
                "Liste Olustur",
              ),
            ),
            const Divider(color: Colors.black),
            ElevatedButton(
              onPressed: () {
                bildirimGoster();
              },
              child: const Text(
                "Bildirim Olustur",
              ),
            ),
            SayfaGecisButton(
                isim: "Timer Kullanimi", sayfa: const TimerKullanimi()),
          ],
        ),
      ),
    );
  }
}

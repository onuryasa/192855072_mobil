import 'package:flutter/material.dart';

import 'anaSayfa.dart';
import 'sifremiUnuttum.dart';
import 'uyeOl.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Girissayfasi(),
        'uyeol': (context) => Uyeol(),
        'sifremiunuttum': (context) => Sifremiunuttum(),
        'anasayfa': (context) => Anasayfa()
      },
      initialRoute: '/',
    );
  }
}

class Girissayfasi extends StatefulWidget {
  @override
  Girissayfasi1 createState() => Girissayfasi1();
}

class Girissayfasi1 extends State<Girissayfasi> {
  String kullaniciadi;
  String sifre;

  final deger = GlobalKey<FormState>();

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: deger,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Kullanıcı Adı'),
                onSaved: (deger) {
                  kullaniciadi = deger;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Şifre'),
                onSaved: (deger) {
                  sifre = deger;
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text('Şifremi Unuttum'),
                    onPressed: () {
                      Navigator.pushNamed(context, 'sifremiunuttum');
                    },
                  ),
                  MaterialButton(
                    child: Text('Üye ol'),
                    onPressed: () {
                      Navigator.pushNamed(context, 'uyeol');
                    },
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  deger.currentState.save();
                  if (kullaniciadi == "demo" && sifre == "demo") {
                    Navigator.pushNamed(context, 'anasayfa');
                  } else {
                    debugPrint('Kullanıcı adı veya şifre yanlış');
                  }
                },
                child: Text('Giriş'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

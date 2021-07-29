import 'package:desfoodd/Authenticate/CreateAccount.dart';
import 'package:desfoodd/Authenticate/Methods.dart';
import 'package:desfoodd/anagovde.dart';
import 'package:desfoodd/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iskele(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  _IskeleState createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool giris_durum = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900]!,
              Colors.orange[800]!,
              Colors.orange[400]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ekranyuksekligi / 15,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Desfood",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Hoşgeldiniz",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ekranyuksekligi / 100,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ekranyuksekligi / 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (tfgirdisi) {
                                        if (tfgirdisi!.isEmpty) {
                                          return "Email Boş Geçilemez";
                                        }

                                        return tfgirdisi.contains("@")
                                            ? null
                                            : "Geçerli Bir Email Giriniz";
                                      },
                                      controller: _email,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined),
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (tfgirdisi) {
                                        //GİRİLEN VERİ
                                        if (tfgirdisi!.isEmpty) {
                                          //BOŞSA
                                          return "Şifre Boş Geçilemez";
                                        } else if (tfgirdisi.length < 6) {
                                          return "Şifre En Az 6 Karakter Olmalıdır";
                                        }
                                        return null; //DEĞİLSE BİŞEY GÖSTERME
                                      },
                                      controller: _password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline),
                                        labelText: "Şifre",
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        hintText: "Şifre",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Parolanızı mı unuttunuz?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 100,
                          width: ekrangenisligi,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            //color: Colors.orange[900],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: ekrangenisligi / 2,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.orange,
                                      elevation: 5,
                                      primary: Colors.orange[900],
                                    ),
                                    child: Text("Giriş",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    onPressed: () async {
                                      bool controlsonucu = formKey.currentState!
                                          .validate(); //İFLERİN DURUMUNU KONTROL ET
                                      if (controlsonucu == true) {
                                        if (_email.text.isNotEmpty &&
                                            _password.text.isNotEmpty) {
                                          logIn(_email.text, _password.text)
                                              .then((user) {
                                            if (user != null) {
                                              print("Login Sucessfull");

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          AnaGovde()));
                                            }
                                          });
                                        }
                                      }
                                    }),
                              ),
                              SizedBox(
                                width: ekrangenisligi / 3,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.orange[900],
                                    elevation: 5,
                                    primary: Colors.orange[900],
                                  ),
                                  child: Text("Kayıt Ol",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateAccount()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Google Hesabı İle Devam Et",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: ekranyuksekligi / 18,
                          width: ekrangenisligi,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    //color: Colors.red,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("resimler/google.png"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

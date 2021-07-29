import 'package:desfoodd/screens/HomeScreen.dart';
import 'package:desfoodd/screens/Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AnaGovde extends StatefulWidget {
  const AnaGovde({Key? key}) : super(key: key);

  @override
  _AnaGovdeState createState() => _AnaGovdeState();
}

class _AnaGovdeState extends State<AnaGovde> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text("Anasayfa"),
      // ),
      body: bottomNavigationBar(),
    );
  }
}

class bottomNavigationBar extends StatefulWidget {
  @override
  _iskele createState() => _iskele();
}

class _iskele extends State<bottomNavigationBar> {
  final _pageController = PageController();
  int _Page = 0;
  int pressedButtonNo = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    return Scaffold(
      body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomeScreen(),
            /*Favoriler(),
            Tarifler(),*/
            SettingScreen(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.linearToEaseOut,
        buttonBackgroundColor: Colors.orange[600],
        index: 0,
        items: <Widget>[
          Icon(Icons.home_outlined,
              size: 30,
              color: (pressedButtonNo == 0) ? Colors.white : Colors.grey),
          Icon(Icons.favorite_outline,
              size: 30,
              color: (pressedButtonNo == 1) ? Colors.white : Colors.grey),
          Icon(Icons.bookmarks_outlined,
              size: 30,
              color: (pressedButtonNo == 2) ? Colors.white : Colors.grey),
          Icon(Icons.account_circle_outlined,
              size: 30,
              color: (pressedButtonNo == 3) ? Colors.white : Colors.grey),
        ],
        color: Colors.white,
        backgroundColor: Colors.grey[100]!,
        height: 50,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
            pressedButtonNo = index;
          });
        },
      ),
    );
  }
}

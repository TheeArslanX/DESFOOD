import 'package:desfoodd/constans/constans.dart';
import 'package:desfoodd/constans/size_config.dart';
import 'package:desfoodd/screens/profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    return Scaffold(
      appBar: buildAppbar(ekrangenisligi),
      body: ProfileBody(),
    );
  }

  AppBar buildAppbar(double ekrangenisligi) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      centerTitle: true,
      title: Text(
        "PROFİLE",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: ekrangenisligi * 0.06,
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ekrangenisligi * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}

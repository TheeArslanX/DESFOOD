import 'package:desfoodd/constans/size_config.dart';
import 'package:desfoodd/screens/home/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDenemeScreen extends StatelessWidget {
  const HomeDenemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      //bottomNavigationBar: AnaGovde(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("resimler/icons/square.svg"),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Image.asset(
        "resimler/a.png",
        height: 50,
        width: 50,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("resimler/icons/magnifiying-glass.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

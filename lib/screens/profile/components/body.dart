import 'package:desfoodd/constans/constans.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;

    return Column(
      children: [
        SizedBox(
          height: ekranyuksekligi * 0.2,
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: ekranyuksekligi * 0.15,
                  color: kPrimaryColor,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: ekranyuksekligi * 0.005),
                      height: ekranyuksekligi * 0.2,
                      width: ekrangenisligi * 0.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: ekrangenisligi * 0.02,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/pic.png"),
                        ),
                      ),
                    ),
                    Text(
                      "CEO Emre Arslan",
                      style: TextStyle(
                        fontSize: ekrangenisligi * 0.04,
                        color: kTextColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("CEO_EMRE_ARSLAN@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8492A2),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

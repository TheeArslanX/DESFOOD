import 'package:desfoodd/models/RecipeBundel.dart';
import 'package:desfoodd/screens/home/reciple_bundel_card.dart';
import 'package:flutter/material.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;

    return SafeArea(
      child: Column(
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ekrangenisligi * 0.03),
              child: GridView.builder(
                itemCount: recipeBundle.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: /*SizeConfig.orientation.landscape ? 2 :*/ 1,
                    mainAxisSpacing: /*SizeConfig.orientation.landscape ? SizeConfig.defaultSize * 2 : 0*/ 20,
                    childAspectRatio: 1.65),
                itemBuilder: (context, index) => RecipeBundelCard(
                  recipeBundle: recipeBundle[index],
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

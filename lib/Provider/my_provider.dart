import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desfoodd/Modles/Catagories_moddle.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  List<CatagoriesModle> categoriesList = [];
  late CatagoriesModle catagoriesModle;

  Future<void> getCategories() async {
    List<CatagoriesModle> newCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MJucijJOEZ0ovpDKvi5O')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      catagoriesModle = CatagoriesModle(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(catagoriesModle.name);
      newCategoriesList.add(catagoriesModle);
      categoriesList = newCategoriesList;
    });
  }

  get throwList {
    return categoriesList;
  }
}

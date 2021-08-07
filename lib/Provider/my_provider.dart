import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desfoodd/Modles/Catagories_moddle.dart';
import 'package:desfoodd/Modles/yemekler_modle.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  List<CatagoriesModle> burgerList = [];
  late CatagoriesModle burgerModle;

  Future<void> getBurgerCategori() async {
    List<CatagoriesModle> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MJucijJOEZ0ovpDKvi5O')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModle = CatagoriesModle(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(burgerModle.name);
      newBurgerList.add(burgerModle);
      burgerList = newBurgerList;
    });
    notifyListeners();
  }

  get throwBurgerList {
    return burgerList;
  }

  //2. kategori//
  List<CatagoriesModle> resipeList = [];
  late CatagoriesModle resipeModle;

  Future<void> getResipeCategori() async {
    List<CatagoriesModle> newResipleList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MJucijJOEZ0ovpDKvi5O')
        .collection('tarif')
        .get();
    querySnapshot.docs.forEach((element) {
      resipeModle = CatagoriesModle(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(resipeModle.name);
      newResipleList.add(resipeModle);
      resipeList = newResipleList;
    });
    notifyListeners();
  }

  get throwResipleList {
    return resipeList;
  }

  //3. kategori//
  List<CatagoriesModle> lahmacunList = [];
  late CatagoriesModle lahmacunModle;

  Future<void> getLahmacunCategori() async {
    List<CatagoriesModle> newLahmacunList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MJucijJOEZ0ovpDKvi5O')
        .collection('lahmacun')
        .get();
    querySnapshot.docs.forEach((element) {
      lahmacunModle = CatagoriesModle(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(lahmacunModle.name);
      newLahmacunList.add(lahmacunModle);
      lahmacunList = newLahmacunList;
    });
    notifyListeners();
  }

  get throwLahmacunList {
    return lahmacunList;
  }

  //SİNGLE FOOD İTEM//

  List<FoodModle> foodModleList = [];
  late FoodModle foodModle;

  Future<void> getFoodList() async {
    List<FoodModle> newFoodModleList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('yemekler').get();
    querySnapshot.docs.forEach((element) {
      foodModle = FoodModle(
        image: element.get('image'),
        name: element.get('name'),
      );
    });
    newFoodModleList.add(foodModle);
    foodModleList = newFoodModleList;
    notifyListeners();
  }

  get throwFoodModleList {
    return foodModleList;
  }
}

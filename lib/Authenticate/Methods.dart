import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desfoodd/Authenticate/LoginScree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Hesap başarıyla oluşturuldu");

      // ignore: deprecated_member_use
      user.updateProfile(displayName: name);

      await _firestore.collection('users').doc(email).set({
        "name": name,
        "email": email,
        "sifre": password,
        "uid": _auth.currentUser!.uid,
      });
      
      
      return user;
    } else {
      print("Hesap oluşturulamadı");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
   
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Giriş Başarılı");
      _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          // ignore: deprecated_member_use
          .then((value) => user.updateProfile(displayName: value['name']));
          
                 
      return user;
    } else {
      print("Giriş başarısız");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
    });
  } catch (e) {
    print("error");
  }
}
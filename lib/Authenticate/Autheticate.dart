import 'package:desfoodd/Authenticate/LoginScree.dart';
import 'package:desfoodd/screens/components/bottom_navigatin_bar/anagovde.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return AnaGovde();
    } else {
      return Iskele();
    }
  }
}

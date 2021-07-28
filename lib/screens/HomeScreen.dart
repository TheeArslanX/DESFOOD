import 'package:desfoodd/Authenticate/Methods.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("ANA SAYFA",style: TextStyle(fontSize: 25),),

          IconButton(
              onPressed: () {
                logOut(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      
    );
  }
}
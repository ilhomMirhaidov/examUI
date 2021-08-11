import 'package:fayrbase4/ui/loginPage.dart';
import 'package:fayrbase4/ui/sometihgWentWrong.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:FutureBuilder(
        future: _init,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return SomethingWentWrong();
          }
          if(snapshot.connectionState == ConnectionState.done){
            return LoginPage();
          }
          return CircularProgressIndicator();

        },
      ),
    );
  }
}

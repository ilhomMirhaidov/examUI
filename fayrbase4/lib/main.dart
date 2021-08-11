import 'package:fayrbase4/IkkinchiPage.dart';
import 'package:fayrbase4/models/AsosiyPage.dart';
import 'package:fayrbase4/ui/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase/home.dart';
import 'models/homePage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
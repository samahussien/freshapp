import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh/apple.dart';
import 'package:fresh/cart.dart';

import 'home.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh',

      home: HomePage(),
    );
  }
}

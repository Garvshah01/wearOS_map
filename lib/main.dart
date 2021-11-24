// ignore: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'Map.dart';
import 'animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NewPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(backgroundColor: Colors.black,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.dark,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieapp/crud/crudpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(backgroundColor: Colors.black, primaryColor: Colors.black),
      home: CrudPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:personal_expense/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        //errorColor: Colors.red,
        fontFamily: 'Ubuntu',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
      ),
      home: Home(),
    );
  }
}

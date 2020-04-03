import 'package:day14/pages/home.dart';
import 'package:day14/pages/login.dart';
import 'package:flutter/material.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => Login(),
        'home' : (BuildContext context) => HomePage(),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:cnss2/screen/bottom_nav_screen.dart';

class Dashboard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavScreen(),
    );
  }
}

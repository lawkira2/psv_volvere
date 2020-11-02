import 'dart:async';

import 'package:flutter/material.dart';
import 'package:psv_volvere/Screen/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Timer> loadtime() async {
    return Timer(Duration(seconds: 2), navigator);
  }

  navigator() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  @override
  void initState() {
    loadtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/Logo.png'),
      ),
    );
  }
}

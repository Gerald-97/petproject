import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';
import 'package:rgproject/activity/onboarding/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent
        ),
        primaryColor: MyColors.defaultPurple,
        fontFamily: 'Futura',
        textTheme: TextTheme(
          headline: TextStyle(
            color: MyColors.headlineBlack,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            height: 1.2
          ),
          title: TextStyle(
            color: MyColors.titleBlack,
            fontSize: 14,
            letterSpacing: .8
          ),
          body1: TextStyle(
            color: MyColors.headlineBlack,
            fontSize: 12,
          ),
        ),
      ),
      home: Welcome(),
    );
  }
}
